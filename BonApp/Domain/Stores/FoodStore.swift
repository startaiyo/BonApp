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

    var allFoods = [FoodDataModel]()
    var localFoods = [FoodDataModel]()

    @MainActor
    init(modelContainer: ModelContainer = try! ModelContainer(for: FoodDataModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))) {
        self.modelContainer = modelContainer
        self.modelContext = modelContainer.mainContext
    }

    func loadFoods() {
        localFoods = try! modelContext.fetch(FetchDescriptor<FoodDataModel>()).sorted(by: { $0.createdAt > $1.createdAt })
    }

    func addFood(_ food: FoodDataModel) {
        modelContext.insert(food)
        try! modelContext.save()
    }

    func deleteFood(_ food: FoodDataModel) {
        modelContext.delete(food)
    }
}
