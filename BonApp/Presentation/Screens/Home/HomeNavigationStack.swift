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
                            HomeDetailView(food: foodData)
                            .background(.lightPink)
                    }
                }
        }
    }
}

#Preview {
    HomeNavigationStack()
        .environment(Router())
}
