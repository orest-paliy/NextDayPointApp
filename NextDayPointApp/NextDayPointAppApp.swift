//
//  NextDayPointAppApp.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import SwiftUI

@main
struct NextDayPointAppApp: App {
    @StateObject var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path){
                MonthPickerView()
                    .navigationDestination(for: AppPage.self, destination: {
                        page in
                        page.view
                    })
                    .sheet(item: $coordinator.sheet, content: {value in
                        if case let .dayRater(date, day) = value{
                            DayRaterView(viewModel: DayRaterViewModel(repository: CoreDataRepository<Day>(), date: date, day: day))
                                .presentationDetents([.medium])
                                .presentationDragIndicator(.visible)
                                .presentationBackground(.regularMaterial)
                        }
                    })
                    .environmentObject(coordinator)
            }
        }
    }
}
