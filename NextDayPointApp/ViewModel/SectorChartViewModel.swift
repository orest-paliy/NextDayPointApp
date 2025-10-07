//
//  SectorChartViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 07.10.2025.
//

import Foundation
import Combine

final class SectorChartViewModel: ObservableObject {
    @Published var dailyJoinedScore: [Int: Int] = [:]
    @Published var dataForMonth: [Day] = [] {
        didSet { countRating() }
    }

    private var storage: DayStorage
    private var cancellables = Set<AnyCancellable>()

    init(storage: DayStorage) {
        self.storage = storage

        storage.$daysOfMonth
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newDays in
                self?.dataForMonth = newDays
            }
            .store(in: &cancellables)
    }

    private func countRating() {
        dailyJoinedScore = Dictionary(grouping: dataForMonth, by: { Int($0.rating) })
            .mapValues { $0.count }
    }
}


