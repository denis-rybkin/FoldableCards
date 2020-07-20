//
//  MessageView.swift
//  TestApp
//
//  Created by Den on 2020-07-20.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    
    @Binding var foldPercentage: Double
    
    var body: some View {
        Text("How is your quarantine going so far?")
            .font(.largeTitle)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .opacity(1 - (self.foldPercentage / 100)*3)
        
    }
}

