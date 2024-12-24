//
//  FoodCellView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/22.
//

import SwiftUI
import Kingfisher

struct FoodCellView: View {
    let food: FoodDataModel
    let imageSize: CGFloat
    let screenType: ScreenType

    enum ScreenType {
        case home
        case myFoods
    }

    var body: some View {
        ZStack {
            if let image = UIImage(data: food.image) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize)
                    .clipped()
            }

            if featureFlags().isDebugMode {
                VStack {
                    switch screenType {
                    case .home:
                        Spacer()
                        HStack {
                            Button {
                                print("Button tapped")
                            } label: {
                                HStack {
                                    Image(systemName: "heart.fill")
                                    Text(String(1))
                                }
                                .padding()
                                .background(Color.gray.opacity(0.8))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                            }
                            .padding([.bottom, .leading], 10)
                            Spacer()
                        }
                    case .myFoods:
                        HStack {
                            Spacer()
                            Button {
                                print("share button tapped")
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                                    .padding()
                                    .background(Color.gray.opacity(0.8))
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }
                            .padding([.top, .trailing], 10)
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
