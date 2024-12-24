//
//  ContentView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        RootView()
    }
}

#Preview {
    ContentView()
        .environment(Router())
        .environment(FoodStore())
}
