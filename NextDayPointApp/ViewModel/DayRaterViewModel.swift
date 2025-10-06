//
//  DayRaterViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import Combine


final class DayRaterViewModel<R: Repository>: ObservableObject where R.Entity == Day{
    @Published var rating: Double = 5
    @Published var dayDescription: String = ""
    let repository: R
    private var day: Day?
    private var date: Date
    
    func saveInfo(){
        if let day{
            day.rating = Int16(rating)
            day.dayDescription = dayDescription
            do{
                try repository.update()
            }catch{}
        }else{
            do{
                try repository.create(configure: {dayInfo in
                    dayInfo.rating = Int16(rating)
                    dayInfo.dayDescription = dayDescription
                    dayInfo.date = date
                })
            }catch {}
        }
    }
    
    init(repository: R, date: Date, day: Day?){
        self.date = date
        self.day = day
        self.repository = repository
        if let day{
            rating = Double(day.rating)
            dayDescription = day.dayDescription ?? ""
        }
    }
}
