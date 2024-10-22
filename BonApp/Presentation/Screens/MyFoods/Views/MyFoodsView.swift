//
//  MyFoodsView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

enum MyFoodsRoute: Hashable {
    case detail(FoodData)
}

struct MyFoodsView: View {
    let onTapGesture: (FoodData) -> Void

    private let foods: [FoodData] = Array(repeating: (), count: 10).map { .init(imageURLString: "https://images.unsplash.com/photo-1512149177596-f817c7ef5d4c", title: "hoge") }
    private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
    private let imageSize = UIScreen.main.bounds.width / 2 - 20

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(foods) { food in
                        FoodCellView(food: food, imageSize: proxy.size.width / 2, screenType: .myFoods)
                            .onTapGesture {
                                onTapGesture(food)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    MyFoodsView(onTapGesture: { _ in })
}
