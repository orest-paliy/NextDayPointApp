//
//  MonthPickerViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 05.10.2025.
//

import Foundation
import Combine

class MonthPickerViewModel: ObservableObject{
    @Published var selectedMonth: String = ""
    @Published var isSelectedMonthNewer = false
    @Published var idForTransition = UUID()
    
    private var currentMonthIndex: Int = -1
    private var currentMonth: Date = .now
    private let callendar = Calendar.current
    
    init(){
        if let currentMonth = callendar.date(from: callendar.dateComponents([.month, .year], from: currentMonth)),
           let currentMonthIndex = callendar.dateComponents([.month], from: currentMonth).month{
            self.currentMonth = currentMonth
            checkSelectedMonthStatus(currentMonthIndex)
            selectedMonth = formatCurrentMonth()
        }
    }
    
    func changeSelectedMonth(up: Bool){
        if let changedMonth = callendar.date(byAdding: .month, value: up ? 1 : -1, to: currentMonth),
           let currentMonthIndex = callendar.dateComponents([.month], from: currentMonth).month{
            checkSelectedMonthStatus(currentMonthIndex)
            currentMonth = changedMonth
        }
        selectedMonth = formatCurrentMonth()
    }
    
    func formatCurrentMonth() -> String{
        let formater = DateFormatter()
        formater.dateFormat = "MMMM"
        return formater.string(from: currentMonth)
    }
    
    func checkSelectedMonthStatus(_ selectedMonthIndex: Int){
        isSelectedMonthNewer = selectedMonthIndex >= currentMonthIndex
        currentMonthIndex = selectedMonthIndex
        idForTransition = UUID()
    }
}
