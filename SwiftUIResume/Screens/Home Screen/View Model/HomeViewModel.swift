//
//  HomeViewModel.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/3.
//

import Foundation
import SwiftUI
import Combine

enum FileError: Error, CustomStringConvertible {
    
    case fetchError
    case filenNotExist
    
    var description: String {
        switch self {
        case .fetchError:
            return "读取文件失败"
        case .filenNotExist:
            return "文件不存在"
        }
    }
}

class HomeViewModel: ObservableObject {
    
    /// 文件内容
    @Published private(set) var fileContent: [String] = []
    /// 单段落文本
    @Published private(set) var singleText: String = ""
    /// 多段落文本
    @Published private(set) var multipleText: [String] = []
  
    @Published private(set) var width: CGFloat = 300
    @Published private(set) var style: DialogueStyle = .none
    @Published private(set) var singleAttribute: AttributedString = ""
    @Published private(set) var multipleAttribute: [AttributedString] = []
    /// 背景图
    @Published private(set) var isImageChanging: Bool = false
    /// 控制背景图动画
    @Published private(set) var bkImage: String = "" {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isImageChanging = true
            }
        }
    }
    
    static var index: Int = 0
    
    /// 判断字符是否为数字、字母或"#"的正则表达式
    let predicate = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9#]+$")
    
    var showStorySubject = CurrentValueSubject<Int, Never>(0) 
    var analyseTextSubject = PassthroughSubject<String, Never>()
    var splitTextSubject = PassthroughSubject<[String], Never>()
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        
        // 添加Combine订阅
        fetchFileSubscription(self.dataService)
        addImageSubscription()
        addShowTextSubscription()
        addTextLimitSubscription()
        addTextWidthSubscription()
    }
}

// MARK: - Combine Extension
extension HomeViewModel {
    
    /// 订阅读文件发布
    /// - 读取的文件内容存储到 fileContent 数组
    ///   读取失败、文件不存在等情况，错误信息也存入 fileContent
    private func fetchFileSubscription(_ service: DataServiceProtocol) {
        service.fetchData()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    if let error = error as? FileError,
                       let self = self {
                        // 读文件失败时`fileContent`存放失败信息
                        self.fileContent.append(error.description)
                    }
                default:
                    break
                }
            } receiveValue: { [weak self] content in
                guard let self = self else { return }
                // 读文件完成后，文件内容存放到`fileContent`
                self.fileContent = content.dropLast()
            }
            .store(in: &cancellables)
    }
    
    /// 用户点击进行下一步或上一步的发布者
    /// - 由于文本和图片都需要订阅此Publisher
    ///   采用Share()避免多次创建副本
    private var sharePublisher: Publishers.Share<CurrentValueSubject<Int, Never>> {
        self.showStorySubject.share()
    }
    
    /// 订阅背景图发布
    /// - 背景图数组的Sequence发布者每次发布一个图片内容
    ///   发布时判断用户是否点击了上一步或下一步
    ///   如果用户点击，则判断是否和元组中的序号相同
    ///   序号相同表示要显示此背景图
    private func addImageSubscription() {
        DataModel.mockImageArray.publisher
            .flatMap { index in
                self.sharePublisher.filter { value in
                    value == index.1
                }
                .map { _ in index }
            }
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.isImageChanging = false
                self?.bkImage = value.0
            }
            .store(in: &cancellables)
    }
    
    /// 订阅文本发布
    /// - 以用户点击上一步或下一步启动Combine流程
    ///   当用户点击，切换为文件内容Sequence的Publisher
    ///   并发布用户需要跳转到位置的数据
    private func addShowTextSubscription() {
        sharePublisher
            .map { self.fileContent.publisher.output(at: $0) }
            .switchToLatest()
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                let chString = value
                withAnimation(.easeInOut) {
                    if chString.contains(",") {
                        self?.multipleText.removeAll()
                        self?.splitTextSubject.send(chString.components(separatedBy: ","))
                        self?.style = .double
                    } else {
                        self?.singleText = chString
                        self?.style = .single
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    /// 订阅处理两段式文本发布
    /// - 判断两段式文本是否有过长的文本
    ///   如果超过 splitIndex 规定的长度，则插入`\r`进行换行
    /// - Combine流程由 PassthroughSubject 发起,Output为[String]
    ///   经flatMap转换为 Sequence Publisher
    private func addTextLimitSubscription() {
        splitTextSubject
            .flatMap { $0.publisher }
            .map { value -> String in
                var str = value
                if value.count > DataModel.splitIndex {
                    let insertIdx = str.index(str.startIndex, offsetBy: DataModel.splitIndex)
                    str.insert("\r", at: insertIdx)
                    return str
                } else {
                    return value
                }
            }
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.multipleText.append(value)
                self?.width = 260
            }
            .store(in: &cancellables)
    }
    
    /// 订阅单段文本发布
    /// - 根据文本长度，设置聊天气泡图片宽度
    private func addTextWidthSubscription() {
         $singleText
             .sink {
                 switch $0.count {
                 case 0:
                     withAnimation(.spring()) {
                         self.width = 0
                     }
                 case 1...10:
                     withAnimation(.spring()) {
                         self.width = 200
                     }
                 case 11...13:
                     withAnimation(.spring()) {
                         self.width = 260
                     }
                 default:
                     withAnimation(.spring()) {
                         self.width = 260
                     }
                 }
             }
             .store(in: &cancellables)
    }
    
    private func addSingleTextSubscription() {
        $singleText
            .flatMap { [weak self] value -> Publishers.Sequence<[String], Never> in
                self?.singleAttribute = AttributedString(value)
                return value.components(separatedBy: " ").publisher
            }
            .filter { self.predicate.evaluate(with: $0) }
            .sink { _ in
            } receiveValue: { [weak self] value  in
                if let range = self?.singleAttribute.range(of: value) {
                    self?.singleAttribute[range].foregroundColor = .red
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - API Extension
extension HomeViewModel {
    
    var contentCount: Int {
        fileContent.count
    }
    
    func showNextStory() {
        HomeViewModel.index += 1
        self.showStorySubject.send(HomeViewModel.index)
    }
    
    func showPreviousStory() {
        HomeViewModel.index = (HomeViewModel.index > 1) ? (HomeViewModel.index - 1) : 0
        self.showStorySubject.send(HomeViewModel.index)
    }
    
    func refreshStory() {
        HomeViewModel.index = 0
        bkImage = ""
        showStorySubject.send(HomeViewModel.index)
    }
}
