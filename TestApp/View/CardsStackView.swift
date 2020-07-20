//
//  CardView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct CardsStackView: View {
    
    private let padding: CGFloat = 15
    
    var body: some View {
        ZStack {
            CardView(black: 0.75)
            .padding(padding)
            .padding([.leading, .trailing], padding)
            .offset(y: 40)
            CardView(black: 0.5)
                .padding(padding)
                .offset(y: 30)
            CardView(black: 0)
        }
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 30))
    }
}
