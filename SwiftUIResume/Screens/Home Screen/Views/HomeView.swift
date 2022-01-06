//
//  HomeView.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/3.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm: HomeViewModel
        
    init(dataService: DataServiceProtocol) {
        _vm = StateObject(
            wrappedValue: HomeViewModel(dataService: dataService)
        )
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [.blue, .red, .pink],
                    startPoint: UnitPoint.leading,
                    endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                  
                if HomeViewModel.index != 0 {
                    showBKImage()
                        .ignoresSafeArea()
                }
                    
                HStack {
                    Image("me")
                        .resizable()
                        .aspectRatio(nil, contentMode: .fit)
                        .frame(width: 200, alignment: .leading)
                        .position(x: 60, y: 540)
                    ChatBubbleView()
                        .environmentObject(vm)
                        .position(x: 40, y: 420)
                }
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: 48)
                .offset(x: 10)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                            .onTapGesture {
                                vm.refreshStory()
                            }
                        
                        preButton()
                        nextButton()
                    }
                }
            }
        }
    }
}

extension HomeView {
    
    func showBKImage() -> some View {
        VStack {
            // 背景图过渡切换
            if vm.isImageChanging {
                Image(vm.bkImage)
                    .resizable()
                    .scaleEffect(1.2, anchor: .top)
                    .aspectRatio(nil, contentMode: .fit)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.2)))
            } else {
                EmptyView()
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.2)))
            }
            Spacer()
        }
    }
    
    func preButton() -> some View {
        Button {
            vm.showPreviousStory()
        } label: {
            Image(systemName: "arrowtriangle.left")
                .foregroundColor(HomeViewModel.index == 0 ? .gray : .white)
        }
        .disabled(HomeViewModel.index == 0)
    }
    
    func nextButton() -> some View {
        Button {
            vm.showNextStory()
        } label: {
            Image(systemName: "arrowtriangle.right")
                .foregroundColor(HomeViewModel.index == vm.contentCount - 1 ? .gray : .white)
        }
        .disabled(HomeViewModel.index == vm.contentCount - 1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static let dataService = MockDataService()
    static var previews: some View {
        HomeView(dataService: dataService)
    }
}
