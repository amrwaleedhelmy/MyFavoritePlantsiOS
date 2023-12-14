//
//  FlowerRow.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 08/05/1445 AH.
//

import SwiftUI

struct FlowerRow: View {
    var flower: Flower
    var body: some View {
        HStack {
            flower.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(flower.name)
            Spacer()
            
            if flower.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}
#Preview {
    let flowers = ModelData().flowers
    return Group {
       FlowerRow(flower: flowers[0])
       FlowerRow(flower: flowers[1])
    }
}

