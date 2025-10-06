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
                    .sheet(isPresented: $coordinator.isSheetPresented, content: {
                        DayRaterView()
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                            .presentationBackground(.regularMaterial)
                    })
                    .environmentObject(coordinator)
            }
        }
    }
}
