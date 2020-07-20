//
//  ContentView.swift
//  TestApp
//
//  Created by Den on 2020-07-15.
//  Copyright © 2020 Den. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.clear
        UITabBar.appearance().isTranslucent = false
    }
 
    var body: some View {
        TabView(selection: $selection) {
            CardsStackView()
                .tabItem {
                    Image(systemName: "rectangle.on.rectangle.angled")
                        .font(.system(size: 20))
                }
                .tag(0)
            Image(systemName: "plus")
                .font(.system(size: 50))
                .tabItem {
                    Image(systemName: "plus")
                        .font(.system(size: 26))
                }
                .tag(1)
            Image(systemName: "recordingtape")
                .font(.system(size: 50))
                .tabItem {
                    Image(systemName: "recordingtape")
                        .font(.system(size: 26))
                }
                .tag(2)
        }
        .accentColor(.white)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
