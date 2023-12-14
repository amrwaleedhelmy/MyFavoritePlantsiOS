//
//  ContentView.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 08/05/1445 AH.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            FlowerList()
                .tag(Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
