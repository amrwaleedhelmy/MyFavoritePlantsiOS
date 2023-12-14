//
//  FavoriteButton.swift
//  flowers
//
//  Created by D103-12 on 30/11/2023.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var saveData: () -> Void
    
    var body: some View {
        Button {
            isSet.toggle()
            saveData()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}



#Preview {
    FavoriteButton(isSet: .constant(true), saveData: {})
}
