//
//  MonthGridViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import Combine
import SwiftUI

final class CalendarGridViewModel: ObservableObject {
    @Published var items: [Day] = []
    let month: Int
    let year: Int
    private var calendar: Calendar
    private var storage: DayStorage

    init(month: Int, year: Int, storage: DayStorage) {
        self.month = month
        self.year = year
        self.calendar = Calendar.current
        self.calendar.firstWeekday = 2
        self.storage = storage
        
        self.storage.$daysOfMonth.receive(on: DispatchQueue.main).assign(to: &$items)
    }

    var daysOfWeek: [String] {
        let syms = calendar.shortWeekdaySymbols
        let start = calendar.firstWeekday - 1
        return Array(syms[start...] + syms[..<start])
    }

    var weeks: [[Date?]] {
        let comps = DateComponents(year: year, month: month, day: 1)
        guard
            let firstDay = calendar.date(from: comps),
            let daysRange = calendar.range(of: .day, in: .month, for: firstDay)
        else { return [] }

        let daysInMonth = daysRange.count
        let weekday = calendar.component(.weekday, from: firstDay)
        let leadingEmpty = (weekday - calendar.firstWeekday + 7) % 7

        // Дні місяця як Date
        let middle: [Date?] = (1...daysInMonth).compactMap { day in
            calendar.date(from: DateComponents(year: year, month: month, day: day))
        }

        let leading = Array<Date?>(repeating: nil, count: leadingEmpty)
        let total = leading.count + middle.count
        let trailingEmpty = (7 - (total % 7)) % 7
        let trailing = Array<Date?>(repeating: nil, count: trailingEmpty)

        let cells = leading + middle + trailing

        return stride(from: 0, to: cells.count, by: 7).map {
            Array(cells[$0..<min($0+7, cells.count)])
        }
    }

    func getDayInfo(fo date: Date) -> Day?{
        storage.daysOfMonth.filter({$0.date == date}).first
    }
}
