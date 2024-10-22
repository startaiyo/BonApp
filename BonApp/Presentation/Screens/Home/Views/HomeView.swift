//
//  HomeView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

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
                        Button(action: {
                            print("open camera roll")
                        }) {
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
        }
    }
}

#Preview {
    HomeView(onTapGesture: { _ in })
}
