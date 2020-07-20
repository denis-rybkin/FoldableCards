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
    @Binding var foldPercentage: Double
    
    let name: String
    let city: String
    
    let foldedLabelsOffset: CGFloat = -10
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundColor(.black)
                Text(city)
                    .foregroundColor(.black)
                    .opacity(0.5)
            }
            
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
                .opacity(buttonOpacity())
        }
            .offset(x: 0, y: foldOffset < 0 ? 0 : getOffset())
            .font(.headline)
    }
    
    private func getOffset() -> CGFloat {
        foldOffset + (foldedLabelsOffset * CGFloat(self.foldPercentage/100))
    }
    
    private func buttonOpacity() -> Double {
        return 1 - ((self.foldPercentage / 100) * 1.3)
    }
}
