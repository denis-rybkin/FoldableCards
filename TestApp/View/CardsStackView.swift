//
//  CardView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct CardsStackView: View {
    
    let records = [Record(name: "Cairo Pitt", city: "Toronto"),
                   Record(name: "Amisha Harwood", city: "New York"),
                   Record(name: "Jean Guerra", city: "California"),
                   Record(name: "Ayisha Ryan", city: "Tokyo"),
                   Record(name: "Anna Liberman", city: "Los Angeles"),
                   Record(name: "Alisa Franklyn", city: "Paris, France")]
    
    private let padding: CGFloat = 15
    
    var body: some View {
        ZStack {
            ForEach(getLastThree().indices) { index in
                if index == 0 { // last
                    CardView(black: 0.75, record: self.getLastThree()[index])
                        .padding(self.padding)
                        .padding([.leading, .trailing], self.padding)
                        .offset(y: 40)
                } else if index == 1 { // last but one
                    CardView(black: 0.5, record: self.getLastThree()[index])
                        .padding(self.padding)
                        .offset(y: 30)
                } else { // last but two
                    CardView(black: 0, record: self.getLastThree()[index])
                }
            }
        }
            .background(Image("background")
                            .resizable()
                            .scaledToFill()
                            .blur(radius: 30))
    }
    
    private func getLastThree() -> [Record] {
        var lastRecords = [Record]()
        for i in 0..<3 {
            let index = (records.count - 3) + i
            if let record = records.item(at: index) {
                lastRecords.append(record)
            }
        }
        return lastRecords
    }
    
    struct Record: Identifiable {
        let id = UUID()
        let name: String
        let city: String
    }
    
}

extension View {
    func lastButOne() -> some View {
        self.padding(0)
    }
}

extension Array {
    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
