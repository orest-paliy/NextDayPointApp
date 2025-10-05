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
    
    private let calendar: Calendar
    private let date: Date
    private let repository: any Repository
    
    //MARK: Mock
    init(date: Date, repository: any Repository) {
        self.date = date
        self.repository = repository
        calendar = Calendar.current
        
        let predicate = NSPredicate(format: "date == %@", date as CVarArg)
        do{
            dayRating = try repository.fetch(by: predicate).first as? Day
        }catch{
            self.error = error
        }
    }
    
    //Calculates a specific day of the month
    var dayInMonth: Int {
        calendar.component(.day, from: date)
    }
    
    var hasCurrentDayPassed: Bool {
        dayInMonth < calendar.component(.day, from: Date.now)
    }
}
