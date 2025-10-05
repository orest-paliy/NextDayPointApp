//
//  ContentView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("viewLoaded")
            DayDotView(
                viewModel: DayDotViewModel(
                    date: Date.now,
                    repository: CoreDataRepositoryImpl<Day>(
                        coreDataStack: CoreDataStackImpl()
                    )
                )
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
