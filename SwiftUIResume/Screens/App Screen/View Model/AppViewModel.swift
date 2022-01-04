//
//  AppViewModel.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/2.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    
    @Published var isLaunching: Bool = true
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLaunching = false
        }
    }
}

