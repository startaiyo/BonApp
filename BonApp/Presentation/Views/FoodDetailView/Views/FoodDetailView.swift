//
//  FoodDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI
import Kingfisher

struct FoodDetailView: View {
    let food: FoodData

    private let imageSize = 300.0

    var body: some View {
        VStack(spacing: 100) {
            KFImage(URL(string: food.imageURLString))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: imageSize)
                .clipped()
                .cornerRadius(6)
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

#Preview {
    FoodDetailView(food: .init(imageURLString: "https://images.unsplash.com/photo-1512149177596-f817c7ef5d4c", title: "hoge"))
}
