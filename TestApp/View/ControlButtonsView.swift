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
                        .opacity(1 - (self.foldPercentage / 100))
                }
                Spacer()
                Button(action: {
                }) {
                    Image(systemName: "mic")
                        
                        .font(.system(size: 26))
                        .padding(20)
                        .background(Circle().fill(Color.white.opacity(0.7)))
                        .shadow(radius: 10, x: 0, y: 20)
                        .offset(x: (UIScreen.main.bounds.width/5) * CGFloat(self.foldPercentage / 100), y: 0)
                        
                }
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
    //                    .opacity(1 - (self.foldPercentage / 100))
                }
            }
            .padding()
            .foregroundColor(.black)
            .font(.system(size: 26))
        }
//    }
}
