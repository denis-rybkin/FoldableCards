//
//  CardHeader.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct CardHeader: View {
    
    @Binding var foldOffset: CGFloat
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Alisa Franklyn")
                    .foregroundColor(.black)
                Text("Paris, France")
                    .foregroundColor(.black)
                    .opacity(0.5)
            }
            .offset(x: 0, y: foldOffset < 0 ? 0 : foldOffset)
            
            Spacer()
            
            Button(action: {
            }) {
                Text("Follow")
                    .padding(7)
                    .padding([.leading, .trailing], 5)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
        }
        .font(.headline)
    }
}
