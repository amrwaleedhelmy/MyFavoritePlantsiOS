//
//  FlowerAdd.swift
//  flowers
//
//  Created by D103-12 on 03/12/2023.
//

import SwiftUI

struct FlowerAdd: View {
    @State private var flower = Flower.emptyFlower
    @Environment(ModelData.self) var modelData
    @Binding var isPresentingAddView: Bool
    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        saveImageLocally(inputImage)
    }
    
    func saveImageLocally(_ image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let filename = getDocumentsDirectory().appendingPathComponent("userImage.jpg")
            try? data.write(to: filename)
        }
    }

    // Function to get the app's document directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
        return paths[0]
    }
    
    let type = [Flower.Category.flowers, Flower.Category.vegetables, Flower.Category.fruits]
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Plant Info")) {
                    TextField("Title", text: $flower.name)
                    TextField("Scientific Name", text: $flower.scientificName)
                    Spacer()
                    TextField("Desccription", text: $flower.description,  axis: .vertical)
                        .lineLimit(5...10)
                    Picker("Select Type", selection: $flower.category) {
                        ForEach(type, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    Button {showingImagePicker = true} label: {Text("Check")}
                    .pickerStyle(.menu)
                }
            }
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingAddView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    flower.imageName = flower.name
                                    modelData.flowers.append(flower)
                                    write(modelData.flowers, "FlowerData.json")
                                    isPresentingAddView = false
                                    
                                }
                            }
                        }
    }
        }


#Preview {
    FlowerAdd(isPresentingAddView: .constant(true))
}
