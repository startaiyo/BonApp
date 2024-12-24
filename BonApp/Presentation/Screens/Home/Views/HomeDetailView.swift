//
//  HomeDetailView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI

struct HomeDetailView: View {
    @Environment(FoodStore.self) private var foodStore

    let food: FoodDataModel
    let onDelete: (FoodDataModel) -> Void

    var body: some View {
        VStack {
            FoodDetailView(food: food)
                .padding()
            Button {
                foodStore.deleteFood(food)
                onDelete(food)
            } label: {
                HStack {
                    Image(systemName: "trash")
                    Text("DELETE_TITLE")
                }
                .padding([.leading, .trailing], 10)
                .padding()
                .background(Color.gray.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            if featureFlags().isDebugMode {
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.bonAppPink, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
