//
//  MyFoodsView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

enum MyFoodsRoute: Hashable {
    case detail(FoodDataModel)
}

struct MyFoodsView: View {
    let onTapGesture: (FoodDataModel) -> Void

//    private let foods: [FoodDataModel]
    private let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 0), count: 2)
    private let imageSize = UIScreen.main.bounds.width / 2 - 20

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
//                    ForEach(foods) { food in
//                        FoodCellView(food: food, imageSize: proxy.size.width / 2, screenType: .myFoods)
//                            .onTapGesture {
//                                onTapGesture(food)
//                            }
//                    }
                }
            }
        }
    }
}

#Preview {
    MyFoodsView(onTapGesture: { _ in })
}
