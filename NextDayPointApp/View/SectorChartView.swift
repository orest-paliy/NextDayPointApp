//
//  SectorChartView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 07.10.2025.
//

import SwiftUI
import Charts

struct SectorChartView: View {
    @StateObject var viewModel: SectorChartViewModel
    var storage: DayStorage
    var body: some View {
        let chartData = Array(viewModel.dailyJoinedScore)
        Chart(chartData, id: \.key, content: {item in
            SectorMark(
                angle: PlottableValue.value("Value", item.value),
                innerRadius: .ratio(0.8),
                angularInset: 2
            )
            .cornerRadius(20)
            .foregroundStyle(Rating(rawValue: item.key)?.colorReflection ?? .yellow)
            .annotation(position: .overlay, alignment: .center) {
                Text(Rating(rawValue: item.key)?.emojiReflection ?? "")
            }
        })
    }
    
    init(storage: DayStorage) {
        self.storage = storage
        _viewModel = StateObject(wrappedValue: SectorChartViewModel(storage: storage))
    }
}
