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
            CardView()
            CardView()
        }
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 30))
    }
}
