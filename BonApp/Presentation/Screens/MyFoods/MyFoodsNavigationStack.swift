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
                .navigationDestination(for: MyFoodsRoute.self) { myFoodsRoute in
                    switch myFoodsRoute {
                        case .detail(let foodData):
                            Text(foodData.id.description)
                    }
                }
        }
    }
}

#Preview {
    MyFoodsNavigationStack()
        .environment(Router())
}
