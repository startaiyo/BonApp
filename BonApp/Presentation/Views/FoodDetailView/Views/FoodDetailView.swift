//
//  FoodDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI
import Kingfisher

struct FoodDetailView: View {
    let food: FoodDataModel

    private let imageSize = 300.0

    var body: some View {
        VStack(spacing: 100) {
            if let image = UIImage(data: food.image) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: imageSize)
                    .clipped()
                    .cornerRadius(6)
            }

            VStack(spacing: 0) {
                Text("Title")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(.darkPink)

                Text("Description")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(minHeight: 100, alignment: .top)
                    .padding()
                    .background(.bonAppPink)
            }
        }
    }
}
