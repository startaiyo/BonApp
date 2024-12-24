//
//  HomeNavigationStack.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

enum HomeRoute: Hashable {
    case detail(FoodDataModel)
}

struct HomeNavigationStack: View {
    @Environment(Router.self) private var router
    
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.homeRoutes) {
            VStack {
                HomeView(onTapGesture: { food in
                    router.homeRoutes.append(.detail(food))
                })
            }
            .navigationDestination(for: HomeRoute.self) { homeRoute in
                switch homeRoute {
                case .detail(let foodData):
                    HomeDetailView(food: foodData) { food in
                        router.homeRoutes.removeAll(where: { $0 == .detail(food) })
                    }
                        .background(.lightPink)
                }
            }
            .navigationTitle("BonApp")
            .toolbar {
                if featureFlags().isDebugMode {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // isShowingSideMenu.toggle()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                        }
                    }
                    ToolbarItem {
                        Button {
                            print("Filter tapped")
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .renderingMode(.template)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.bonAppPink, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}
