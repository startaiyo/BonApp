//
//  RootView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/01.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        BaseTabView()
    }
}

#Preview {
    RootView()
        .environment(Router())
}
