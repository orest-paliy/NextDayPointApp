//
//  DayDotViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import Combine

final class DailyDotViewModel: ObservableObject{
    @Published var dayRating: Day?
    @Published var error: Error?
    let date: Date
    
    private let calendar = Calendar.current
    
    init(date: Date, dayRating: Day?) {
        self.date = date
        self.dayRating = dayRating
    }
    
    //Calculates a specific day of the month
    var dayInMonth: Int {
        calendar.component(.day, from: date)
    }
    
    var hasCurrentDayPassed: Bool {
        Date.now >= date
    }
}
