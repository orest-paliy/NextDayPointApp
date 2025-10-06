//
//  MonthGridViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import Combine
    
final class MonthGridViewModel: ObservableObject {
    @Published var filledDays: [Day] = []
    let month: Int
    let year: Int
    private let calendar: Calendar
    let repository = CoreDataRepository<Day>()

    init(month: Int, year: Int, calendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        return calendar
    }()) {
        self.month = month
        self.year = year
        self.calendar = calendar
        filledDays = loadAllRatingsFor(month: month, year: year)
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
    
    func loadAllRatingsFor(month: Int, year: Int) -> [Day]{
        let calendar = Calendar.current
        
        //Start of month
        let startComponents = DateComponents(year: year, month: month)
        guard let startDate = calendar.date(from: startComponents) else {return []}
        
        //End of month
        var endComponents = DateComponents(year: year, month: month+1)
        endComponents.second = -1
        guard let endDate = calendar.date(from: endComponents) else {return []}
        
        //Fetch request
        do{
           return try repository.fetch(by: NSPredicate(format: "date >= %@ AND date <= %@",
                                            startDate as NSDate,
                                            endDate as NSDate))
        }catch{
            return []
        }
    }
    
    func getDayInfo(fo date: Date) -> Day?{
        filledDays.filter({$0.date == date}).first
    }
}
