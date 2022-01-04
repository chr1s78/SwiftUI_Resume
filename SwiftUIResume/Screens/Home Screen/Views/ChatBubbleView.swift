//
//  ChatBubbleView.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/3.
//

import Foundation
import SwiftUI

struct ChatBubbleView: View {

    @EnvironmentObject var vm: HomeViewModel

    var body: some View {
        Group {
            if vm.style == .single {
                Image("single")
                    .resizable()
                    .aspectRatio(nil, contentMode: .fit)
                    .frame(width: vm.width)
            } else {
                Image("Double")
                    .resizable()
                    .aspectRatio(nil, contentMode: .fit)
            }
        }
        .frame(width: vm.width)
        .overlay(
            showText().padding(.horizontal, 20)
        )
    }
}

extension ChatBubbleView {
    
    @ViewBuilder
    func showText() -> some View {
        if vm.style == .single {
            Text(vm.singleText)
                .font(Font.custom("Muyao-Softbrush", size: 21))
        } else if vm.style == .double {
            VStack {
                if vm.multipleText.count == 2 {
                    Text(vm.multipleText[0])
                        .font(Font.custom("Muyao-Softbrush", size: 21))
                        .multilineTextAlignment(.center)
                        .offset(x: -30, y: -40)
                        .rotationEffect(Angle(degrees: -4))
                    Text(vm.multipleText[1])
                        .font(Font.custom("Muyao-Softbrush", size: 21))
                        .offset(x: 30, y: 40)
                        .rotationEffect(Angle(degrees: 3))
                }
            }
        }
    }
}

