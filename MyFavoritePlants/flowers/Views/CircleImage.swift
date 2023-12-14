//
//  CircleImage.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 07/05/1445 AH.
//

import SwiftUI


struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .frame(width: 300, height: 300)
    }
}


#Preview {
    CircleImage(image: Image("Sunflower"))
}
