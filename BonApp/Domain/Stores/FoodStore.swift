//
//  FoodStore.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/14.
//

import Observation
import SwiftData

@Observable
class FoodStore {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    var foods = [FoodDataModel]()

    @MainActor
    init(modelContainer: ModelContainer = try! ModelContainer(for: FoodDataModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))) {
        self.modelContainer = modelContainer
        self.modelContext = modelContainer.mainContext
    }

    func loadFoods() {
        foods = try! modelContext.fetch(FetchDescriptor<FoodDataModel>())
    }

    func addFood(_ food: FoodDataModel) {
        modelContext.insert(food)
        try! modelContext.save()
    }
}
