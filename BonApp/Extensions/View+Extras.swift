//
//  View+Extras.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/26.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
