//
//  Waveform.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct Waveform: View {
    
    let dataSize = 44
    static var waveformData = [Int]() // TODO: - fix logic
    
    init() {
        if Waveform.waveformData.isEmpty {
            for _ in 0..<dataSize { // TODO: - fix logic
                Waveform.waveformData.append(Int.random(in: 0...100))
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(Waveform.waveformData, id: \.self) { level in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black)
                        .frame(width: (UIScreen.main.bounds.width - CGFloat(self.dataSize) * 4) / CGFloat(self.dataSize),
                               height: CGFloat(level))
                }
            }
        }
    }
    
}

struct Waveform_Previews: PreviewProvider {
    static var previews: some View {
        Waveform()
    }
}
