//
//  SwiftUIResumeApp.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/2.
//

import SwiftUI
import Combine

@main
struct SwiftUIResumeApp: App {
    
    @StateObject var vm = AppViewModel()
    let dataService = FileDataService("Me")

    var body: some Scene {
        WindowGroup {
            if vm.isLaunching {
                LaunchView()
                    .onAppear {
                        // 去除多余的打印信息
                        UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                    }
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2.0)))
            } else {
                HomeView(dataService: dataService)
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2.0)))
            }
        }
    }
}
