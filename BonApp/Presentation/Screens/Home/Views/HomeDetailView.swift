//
//  HomeDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI

struct HomeDetailView: View {
    let food: FoodDataModel

    var body: some View {
        VStack {
            FoodDetailView(food: food)
                .padding()
            Button {
                print("like button tapped")
            } label: {
                HStack {
                    Image(systemName: "heart.fill")
                    Text(String(1))
                }
                .padding([.leading, .trailing], 10)
                .padding()
                .background(Color.gray.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
}
