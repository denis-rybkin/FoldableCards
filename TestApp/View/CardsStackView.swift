//
//  CardView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct CardsStackView: View {
    
    var body: some View {
        ZStack {
            CardView(black: 0.75)
            .padding()
            .padding([.leading, .trailing], 20)
            .offset(y: 40)
            CardView(black: 0.5)
                .padding()
                .offset(y: 30)
            CardView(black: 0)
        }
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 30))
    }
}
