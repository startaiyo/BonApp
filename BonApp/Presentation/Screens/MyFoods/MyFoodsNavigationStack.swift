//
//  MyFoodsNavigationStack.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

struct MyFoodsNavigationStack: View {
    @Environment(Router.self) private var router

    var body: some View {
        @Bindable var router = router

        NavigationStack(path: $router.myFoodsRoutes) {
            VStack {
                MyFoodsView(onTapGesture: { food in
                    router.myFoodsRoutes.append(.detail(food))
                })
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
                .navigationDestination(for: MyFoodsRoute.self) { myFoodsRoute in
                    switch myFoodsRoute {
                        case .detail(let food):
                            MyFoodsDetailView(food: food)
                                .background(.lightPink)
                    }
                }
        }
    }
}
