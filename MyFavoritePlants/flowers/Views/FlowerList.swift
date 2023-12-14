//
//  FlowerList.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 08/05/1445 AH.
//

import SwiftUI


struct FlowerList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = true
    @State private var isPresentingAddView = false
    
    var filteredFlowers: [Flower] {
        modelData.flowers.filter { flower in
            (!showFavoritesOnly || flower.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredFlowers) { flower in
                    NavigationLink {
                        FlowerDetail(flower: flower)
                    } label: {
                        FlowerRow(flower: flower)
                    }
                }
            }
            .navigationTitle("Plant List")
            .toolbar {
                Button {
                    isPresentingAddView = true
                } label: {
                    Label("Add Plant", systemImage: "plus")
                        .labelStyle(.iconOnly)
                }
                        }
            .sheet(isPresented: $isPresentingAddView) {
                NavigationStack {
                    FlowerAdd(isPresentingAddView: $isPresentingAddView)
                        .navigationTitle("Add Flower")
                }
            }
        } detail: {
            Text("Select a Plant")
        }
    }
}


#Preview {
    FlowerList()
        .environment(ModelData())
}

