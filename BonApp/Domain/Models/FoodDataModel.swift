//
//  FoodDataModel.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/14.
//

import Foundation
import SwiftData

@Model
class FoodDataModel: Hashable, Identifiable {
    var id = UUID()
    var image: Data
    var title: String
    var caption: String

    init(image: Data, title: String, caption: String) {
        self.image = image
        self.title = title
        self.caption = caption
    }
}
