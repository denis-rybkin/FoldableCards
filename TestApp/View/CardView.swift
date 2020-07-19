//
//  CardView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    enum DragDirection {
        case horisontal, vertical, none
    }
    @State private var dragDirection: DragDirection = .none
    @State private var startDragPoint: CGPoint?
    private var tresholdDirection: CGFloat = 3
    
    @State private var translation: CGSize = .zero
    
    @State private var foldOffset: CGFloat = 0
    @State private var foldPercentage: Double = 0
    @State private var opened = true
    
    let text: String
    
    let cornerRadius: CGFloat = 40
    let inset: CGFloat = 30
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                // Top Half
                VStack {
                    CardHeader(foldOffset: self.$foldOffset, foldPercentage: self.$foldPercentage)
                        .padding(self.inset)
                    MessageView(foldPercentage: self.$foldPercentage)
                        .padding([.leading, .trailing], self.inset)
                }
                    .background(Color.blue.opacity(0.2)) // TODO: - delete
                
                Divider().background(Color.blue)
                
                // Bottom Half
                VStack {
                    Waveform()
                        .opacity(1 - (self.foldPercentage / 100))
                        .padding([.leading, .trailing], self.inset)
//                        .background(Color.purple.opacity(0.3)) // TODO: - delete
                    Text("0:37")
                        .foregroundColor(.black)
                        .opacity(1 - (self.foldPercentage / 100))
                        
                    ControlButtonsView(foldPercentage: self.$foldPercentage)
                        .padding([.leading, .trailing], self.inset)
                }
            }
            .background(Image("Steve")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 30))
            .mask(RoundedRectangle(cornerRadius: self.cornerRadius)
            .padding(.top, self.foldOffset))
            
            .cornerRadius(self.cornerRadius)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width
                                            / geometry.size.width) * 25),
                            anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if self.startDragPoint == nil {
                            self.startDragPoint = value.location
                        }
                        let needSetDirection = self.distance(self.startDragPoint!, value.location) > self.tresholdDirection
                        if needSetDirection {
                            let isHorisontal = abs(self.startDragPoint!.x - value.location.x) > abs(self.startDragPoint!.y - value.location.y)
                            if isHorisontal {
                                self.dragDirection = .horisontal
                            } else {
                                self.dragDirection = .vertical
                            }
                        }
                        switch self.dragDirection {
                        case .horisontal:
                            self.translation = value.translation
                            self.foldOffset = -100
                        case .vertical:
                            let offset = value.location.y - self.startDragPoint!.y
                            
                            if offset < 0 { return }
                            self.foldOffset = offset
                            let percent = (offset / geometry.size.height) * 100
                            self.foldPercentage = Double(percent)
                            
                        case .none:
                            break
                        }
                    }
                    .onEnded { value in
                        
                        self.translation = .zero
                        self.startDragPoint = nil
                        self.dragDirection = .none
                        
                        if self.foldOffset > (self.viewHeight(geometry) / 2) {
                            self.opened = false
                            self.foldPercentage = 100
                            self.foldOffset = geometry.size.height - self.foldedHeight()
                            return
                        }
                        self.foldPercentage = 0
                        self.foldOffset = 0
                    }
            )
            
//                .clipShape(RoundedRectangle(cornerRadius: self.inset).size(width: geometry.size.width, height: 200)) // TODO: - delete
        }
        .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 30))
    }
    
    private func foldedHeight() -> CGFloat {
        return (self.cornerRadius * 2)
    }
    
    private func viewHeight(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height * 0.75
    }
    
    private func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
}
