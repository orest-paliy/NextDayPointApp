//
//  DayDotViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import Combine

final class DayDotViewModel: ObservableObject{
    var dayRating: DayInfo
    private var calendar: Calendar
    
    //MARK: Mock
    init() {
        self.dayRating = DayInfo(date: Date.distantPast, rating: .perfect, description: "Mock description")
        calendar = Calendar.current
    }
    
    //Calculates a specific day of the month
    var dayInMonth: Int { calendar.component(.day, from: dayRating.date) }
    
    var hasCurrentDayPassed: Bool {
        dayInMonth < calendar.component(.day, from: Date.now)
    }
}
