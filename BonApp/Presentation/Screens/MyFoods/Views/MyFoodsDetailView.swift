//
//  MyFoodsDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI

struct MyFoodsDetailView: View {
    let food: FoodData

    var body: some View {
        VStack {
            FoodDetailView(food: food)
                .padding()
            Button {
                print("share button tapped")
            } label: {
                Image(systemName: "square.and.arrow.up")
                .padding([.leading, .trailing], 10)
                .padding()
                .background(Color.gray.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    MyFoodsDetailView(food: .init(imageURLString: "https://images.unsplash.com/photo-1512149177596-f817c7ef5d4c", title: "hoge"))
}
