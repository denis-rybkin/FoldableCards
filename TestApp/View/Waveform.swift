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
    let spacing: CGFloat = 3
    
    static var waveformData = [Int]() // TODO: - fix logic
    
    init() {
        if Waveform.waveformData.isEmpty {
            for _ in 0..<dataSize { // TODO: - fix logic
                Waveform.waveformData.append(Int.random(in: 1...100))
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: self.spacing) {
                ForEach(0..<Waveform.waveformData.count, id: \.self) { i in
                    ZStack {
                        RoundedRectangle(cornerRadius: self.spacing)
                            .fill(self.firstOrLast(i: i) ? Color.blue : Color.black)
                            .frame(width: (geometry.size.width - CGFloat(self.dataSize) * self.spacing) / CGFloat(self.dataSize),
                                   height: CGFloat(Waveform.waveformData[i]))
                    }
                }
            }
            .foregroundColor(.black)
        }
        .background(Color.debug)
    }
    
    // TODO: - only for debug
    private func firstOrLast(i: Int) -> Bool {
        return i == 0 || i == Waveform.waveformData.count-1
    }
}

struct Waveform_Previews: PreviewProvider {
    static var previews: some View {
        Waveform()
    }
}

extension Color {
    static var debug: Color { return Color.red.opacity(0.5) }
}
