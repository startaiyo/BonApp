//
//  HomeView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI
import PhotosUI

struct FoodData: Hashable, Identifiable {
    let id = UUID()
    let imageURLString: String
    let title: String
}

struct HomeView: View {
    let onTapGesture: (FoodData) -> Void

    private let foods: [FoodData] = Array(repeating: (), count: 10).map { .init(imageURLString: "https://images.unsplash.com/photo-1512149177596-f817c7ef5d4c", title: "hoge") }
    private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
    private let imageSize = UIScreen.main.bounds.width / 2 - 20
    @State private var isCameraShowing = false
    @State private var isPickerShowing = false
    @State private var isPhotoEditViewShowing = false
    @State private var isAddDescriptionShowing = false
    @State private var selectedImage: Image?
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(foods) { food in
                            FoodCellView(food: food, imageSize: proxy.size.width / 2, screenType: .home)
                                .onTapGesture {
                                    onTapGesture(food)
                                }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Menu {
                            Button("open camera") {
                                isCameraShowing.toggle()
                            }
                            Button("open library") {
                                isPickerShowing.toggle()
                            }
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color.bonAppPink)
                                    .frame(width: 100, height: 100)
                                Text("+")
                                    .tint(.red)
                                    .font(.system(size: 50))
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
                }
                .padding([.bottom, .trailing], 10)
            }
            .fullScreenCover(isPresented: $isCameraShowing) {
                accessCameraView(selectedImage: $selectedImage)
                    .background(.black)
            }
            .fullScreenCover(isPresented: $isPhotoEditViewShowing) {
                if let image = selectedImage {
                    PhotoEditView(onNextButtonTapped: {
                        isAddDescriptionShowing = true
                    },
                                  image: image)
                        .padding()
                        .background(.white)
                }
            }
            .fullScreenCover(isPresented: $isAddDescriptionShowing) {
                if let image = selectedImage {
                    AddDescriptionView(image: image, onSendButtonTapped: {
                        // Send the image
                    }, onBackButtonTapped: {
                        isPhotoEditViewShowing = true
                    })
                        .padding()
                        .background(.white)
                }
            }
            .photosPicker(isPresented: $isPickerShowing, selection: $selectedItem)
            .onChange(of: selectedItem) {
                Task {
                    if let image = try? await selectedItem?.loadTransferable(type: Image.self) {
                        selectedImage = image
                    }
                }
            }
            .onChange(of: selectedImage) {
                isPhotoEditViewShowing = true
            }
        }
    }
}

struct accessCameraView: UIViewControllerRepresentable {

    @Binding var selectedImage: Image?
    @Environment(\.presentationMode) var isPresented

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView

    init(picker: accessCameraView) {
        self.picker = picker
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = Image(uiImage: selectedImage)
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

#Preview {
    HomeView(onTapGesture: { _ in })
}
