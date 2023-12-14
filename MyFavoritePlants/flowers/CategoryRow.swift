//
//  CategoryRow.swift
//  flowers
//
//  Created by D103-12 on 30/11/2023.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Flower]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) {flower in
                        NavigationLink {
                            FlowerDetail(flower: flower)
                        } label: {
                            CategoryItem(flower: flower)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let flowers = ModelData().flowers
    return CategoryRow(
        categoryName: flowers[0].category.rawValue,
        items: Array(flowers.prefix(4))
    )
}
