//
//  DayDotViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import Combine

final class DayDotViewModel: ObservableObject{
    @Published var dayRating: Day?
    @Published var error: Error?
    
    private let calendar = Calendar.current
    private let date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    //Calculates a specific day of the month
    var dayInMonth: Int {
        calendar.component(.day, from: date)
    }
    
    var hasCurrentDayPassed: Bool {
        Date.now >= date
    }
}
