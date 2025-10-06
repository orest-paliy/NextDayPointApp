//
//  MonthPickerViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 05.10.2025.
//

import Foundation
import Combine

class MonthPickerViewModel: ObservableObject{
    @Published var currentMonth: String = ""
    @Published var currentMonthIdx: Int = 0
    @Published var currentYearIdx: Int = 0
    @Published var id: String = ""
    
    private var calendar = Calendar.current
    private var currentDate = Date.now
    
    init() {
        updateIndexes()
    }
    
    func changeMonth(increase: Bool){
        let amountOfChange = increase ? 1 : -1
        if let newDate = calendar.date(byAdding: Calendar.Component.month, value: amountOfChange, to: currentDate){
            currentDate = newDate
            updateIndexes()
        }
    }
    
    func changeMonth(to date: Date){
        currentDate = date
        updateIndexes()
    }
    
    func updateIndexes(){
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: currentDate)
        currentMonthIdx = dateComponents.month!
        currentYearIdx = dateComponents.year!
        id = "\(currentMonthIdx) \(currentYearIdx)"
        updateMonthTitle()
    }
    
    func updateMonthTitle(){
        let allMonths = calendar.monthSymbols
        currentMonth = allMonths[currentMonthIdx-1]
    }
}
