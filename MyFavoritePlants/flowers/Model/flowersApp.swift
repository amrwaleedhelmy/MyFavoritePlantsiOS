//
//  flowersApp.swift
//  flowers
//
//  Created by Amr Waleed Helmy on 07/05/1445 AH.
//

import SwiftUI

@main
struct flowersApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(modelData)
        }
    }
}
