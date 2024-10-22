//
//  AppScreen.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case home
    case myFoods

    var id: AppScreen { return self }
}

extension AppScreen {
    var label: some View {
        switch self {
            case .home:
                return Label("Home", systemImage: "heart.fill")
            case .myFoods:
                return Label("My Foods", systemImage: "star.fill")
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
