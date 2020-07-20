//
//  ControlButtonsView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct ControlButtonsView: View {
    
    @Binding var foldPercentage: Double
    
    let foldedLabelsOffset: CGFloat = -20
    
    var body: some View {
//        GeometryReader { geometry in
            HStack {
                Button(action: {
                }) {
                    Image(systemName: "heart")
                        .opacity(1 - (self.foldPercentage / 100))
                }
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "pause")
                        .frame(width: 26, height: 18.5)
                }
                .offset(x: xOffset() * 1.2)
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "mic")
                        .padding(20)
                        .font(.system(size: 26))
                        .background(Circle().fill(Color.white.opacity(0.7)).opacity(1 - (self.foldPercentage / 100)))
                        .shadow(radius: 10, x: 0, y: 20)
                        
                }
                .offset(x: xOffset())
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "goforward.10")
                        .opacity(1 - (self.foldPercentage / 100))
                }
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "ellipsis")
                        .opacity(1 - (self.foldPercentage / 100))
                }
            }
            .padding(.bottom, 30)
            .foregroundColor(.black)
            .font(.system(size: 26))
            .offset(y: -getOffset())
        }
//    }
    private func getOffset() -> CGFloat {
        return (foldedLabelsOffset * CGFloat(self.foldPercentage/100))
    }
    
    private func xOffset() -> CGFloat {
        (UIScreen.main.bounds.width/2 - 40) * CGFloat(self.foldPercentage / 100)
    }
}
