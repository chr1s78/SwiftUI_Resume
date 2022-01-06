//
//  LaunchView.swift
//  SwiftUIResume
//
//  Created by Chr1s on 2022/1/2.
//  From StewartLynch@youtube

import SwiftUI

struct LaunchView: View {
    
    @State var endTrim: CGFloat = 0
    @State var isFilled = false
    let pathBounds = UIBezierPath.calculateBounds(
        paths: [.SVG_M_Letter, .SVG_e_Letter]
    )
    
    var body: some View {
        ZStack {
            Color(UIColor.systemRed).ignoresSafeArea()
            HStack(alignment: .bottom, spacing: 0) {
                ZStack {
                    ShapeView(bezier: .SVG_M_Letter, pathBounds: pathBounds)
                        .trim(from: 0, to: endTrim)
                        .stroke(Color.black,lineWidth: 2)
                    ShapeView(bezier: .SVG_M_Letter, pathBounds: pathBounds)
                        .fill(Color.white.opacity(isFilled ? 1 : 0))
                }
                   
                ZStack {
                    ShapeView(bezier: .SVG_e_Letter, pathBounds: pathBounds)
                        .offset(y: 40)
                        .trim(from: 0, to: endTrim)
                        .stroke(Color.black,lineWidth: 2)
                    
                    ShapeView(bezier: .SVG_e_Letter, pathBounds: pathBounds)
                        .fill(Color.white.opacity(isFilled ? 1 : 0))
                        .offset(y: 40)
                }
            }
            .frame(width: 300, height: 300)
            .offset(x: 30)
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    endTrim = 1.0
                }
                withAnimation(.easeInOut(duration: 2).delay(2)) {
                    isFilled = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
