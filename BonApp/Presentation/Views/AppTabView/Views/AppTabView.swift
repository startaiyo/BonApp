//
//  AppTabView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI
import Observation

@Observable
class Router {
    var homeRoutes: [HomeRoute] = []
    var myFoodsRoutes: [MyFoodsRoute] = []
}

struct AppTabView: View {
    @Binding var selection: AppScreen?

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen)
                    .tabItem { screen.label }
            }
        }
    }
}
