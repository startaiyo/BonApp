//
//  AppTabScreen.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

enum AppTabScreen: Hashable, Identifiable, CaseIterable {
    case home
    case myFoods

    var id: AppTabScreen { return self }
}

extension AppTabScreen {
    var label: some View {
        switch self {
            case .myFoods:
                return Label("My Foods", systemImage: "star.fill")
            case .home:
                return Label("Home", systemImage: "heart.fill")

        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
            case .home:
                HomeNavigationStack()
            case .myFoods:
                MyFoodsNavigationStack()
        }
    }
}
