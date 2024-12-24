//
//  BonAppApp.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

@main
struct BonAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Router())
                .environment(FoodStore())
        }
    }
}

struct featureFlags {
    let isDebugMode: Bool

    init() {
    #if DEBUG
        isDebugMode = false
    #else
        isDebugMode = false
    #endif
    }
}
