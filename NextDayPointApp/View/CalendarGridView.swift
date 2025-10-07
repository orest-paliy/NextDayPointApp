//
//  MonthGridView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import SwiftUI

struct CalendarGridView: View {
    let viewModel: CalendarGridViewModel

    var body: some View {
        Grid {
            GridRow {
                ForEach(viewModel.daysOfWeek, id: \.self) { Text($0) }
            }
            Divider()
            ForEach(viewModel.weeks.indices, id: \.self) { w in
                GridRow {
                    ForEach(viewModel.weeks[w].indices, id: \.self) { d in
                        if let cell = viewModel.weeks[w][d] {
                            DailyDotView(viewModel: DailyDotViewModel(date: cell, dayRating: viewModel.getDayInfo(fo: cell)))
                        } else {
                            Text(" ")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CalendarGridView(viewModel: .init(month: 1, year: 2025))
}
