//
//  DayStorage.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 07.10.2025.
//

import Foundation
import Combine

final class DayStorage: ObservableObject{
    @Published var daysOfMonth: [Day] = []
    
    private var repository = CoreDataRepository<Day>()
    func loadAllRatingsFor(month: Int, year: Int){
        let calendar = Calendar.current
        daysOfMonth = []
        
        //Start of month
        let startComponents = DateComponents(year: year, month: month)
        guard let startDate = calendar.date(from: startComponents) else {return}
        
        //End of month
        var endComponents = DateComponents(year: year, month: month+1)
        endComponents.second = -1
        guard let endDate = calendar.date(from: endComponents) else {return}
        
        //Fetch request
        do{
            daysOfMonth = try repository.fetch(
                by: NSPredicate(format: "date >= %@ AND date <= %@",
                startDate as NSDate,
                endDate as NSDate)
            )
        }catch{
            return
        }
    }
}
