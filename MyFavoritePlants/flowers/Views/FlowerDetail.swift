//
//  FlowerDetail.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 08/05/1445 AH.
//

import SwiftUI

struct FlowerDetail: View {
    @Environment(ModelData.self) var modelData
    var flower: Flower
    
    var flowerIndex: Int {
        modelData.flowers.firstIndex(where: { $0.id == flower.id})!
    }
        
    var body: some View {
            
        @Bindable var modelData = modelData
        
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    CircleImage(image: flower.image)
                        .offset(y: 10)
                        .padding(.bottom, 80)
                    Spacer()
                }
                
                ScrollView {VStack(alignment: .leading) {
                    HStack {
                        Text(flower.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.flowers[flowerIndex].isFavorite) {
                            write(modelData.flowers, "FlowerData.json")
                        }
                    }
                    
                    HStack {
                        Text("Scientific Name:")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                        
                        Text(flower.scientificName)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                    }
                    
                    Divider()
                    
                    Text("About \(flower.name)")
                        .font(.title2)
                    
                    Text(flower.description)
                        .font(.none)
                }}
            }
            .padding()
            .navigationTitle(flower.name)
            .navigationBarTitleDisplayMode(.inline)
    }

    
}


#Preview {
    let modelData = ModelData()
    return FlowerDetail(flower: ModelData().flowers[5])
        .environment(modelData)
}
