//
//  DayDotViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import Combine
import SwiftUI

final class DailyDotViewModel: ObservableObject{
    @Published var dayRating: Day?
    @Published var error: Error?
    var storage: DayStorage
    let date: Date
    
    private let calendar = Calendar.current
    
    init(date: Date, storage: DayStorage) {
        self.date = date
        self.storage = storage
        dayRating = storage.daysOfMonth.first(where: {$0.date == date})
    }
    
    //Calculates a specific day of the month
    var dayInMonth: Int {
        calendar.component(.day, from: date)
    }
    
    var hasCurrentDayPassed: Bool {
        Date.now >= date
    }
    
    func getBackgroundColor() -> Color{
        if hasCurrentDayPassed{
            if let dayRating{
                return Rating(rawValue: Int( dayRating.rating))?.colorReflection ?? .yellow
            }else{
                return .yellow
            }
        }else{
            return .gray
        }
    }
}
