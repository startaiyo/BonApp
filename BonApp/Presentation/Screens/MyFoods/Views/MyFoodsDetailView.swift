//
//  MyFoodsDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI

struct MyFoodsDetailView: View {
    let food: FoodDataModel

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
