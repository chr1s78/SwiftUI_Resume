//
//  DataModel.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/3.
//

import Foundation

enum DialogueStyle {
    case none
    case single
    case double
}

struct DataModel {
    static let mockImageArray: [(String, Int)] = [
      //  ("bk", 0),
        ("bk1", 1),
        ("bk2", 3),
        ("bk3", 5),
        ("bk4", 7),
        ("bk5", 8),
        ("bk6", 10),
        ("bk7", 15)
    ]
    
    static let splitIndex = 8
}
