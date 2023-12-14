//
//  Flower.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 07/05/1445 AH.
//

import Foundation
import SwiftUI
import CoreLocation


struct Flower: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var scientificName: String
    var availability: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case flowers = "Flowers"
        case fruits = "Fruits"
        case vegetables = "Vegetables"
    }
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    static var emptyFlower: Flower {
        Flower(id: UUID().hashValue, name: "", scientificName: "", availability: "", description: "", isFavorite: false, isFeatured: false, category: Category.flowers, imageName: "")
        }
}
