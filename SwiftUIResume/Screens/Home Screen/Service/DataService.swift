//
//  DataService.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/3.
//

import Foundation
import Combine

// MARK: - 协议: 获取数据
protocol DataServiceProtocol {
    // Fetch Data from file. network. database or anywhere
    func fetchData() -> AnyPublisher<[String], Error>
}

// MARK: - 获取文件数据服务
class FileDataService: DataServiceProtocol {
    
    let fileName: String
    
    init(_ file: String) {
        self.fileName = file
    }
    
    func fetchData() -> AnyPublisher<[String], Error> {
        Future<[String], Error> { [weak self] promise in
            if let fileURL = Bundle.main.url(forResource: self?.fileName, withExtension: "txt") {
                if let fileContents = try? String(contentsOf: fileURL) {
                    promise(.success(fileContents.components(separatedBy: "\n")))
                } else {
                    promise(.failure(FileError.fetchError))
                }
            } else {
                promise(.failure(FileError.filenNotExist))
            }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: - 测试环境数据服务
class MockDataService: DataServiceProtocol {
    
    let mockData = [
        "The first sentence.",
        "The second sentence, contains two lines.",
        "The third sentence, contains two lines.",
        "The last sentence."
    ]
    
    func fetchData() -> AnyPublisher<[String], Error> {
        Just(mockData)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
