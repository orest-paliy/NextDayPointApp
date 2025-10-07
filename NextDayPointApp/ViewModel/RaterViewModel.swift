//
//  DayRaterViewModel.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import Combine


final class RaterViewModel<R: Repository>: ObservableObject where R.Entity == Day{
    @Published var rating: Double = 5
    @Published var dayDescription: String = ""
    @Published var dayInfo: Day?
    var dotViewModel: DailyDotViewModel?
    let repository: R
    private var date: Date
    
    func saveInfo(){
        if let day = dotViewModel?.dayRating{
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
                    if let vm = dotViewModel{
                        vm.dayRating = dayInfo
                    }
                })
            }catch {}
        }
    }
    
    init(repository: R, viewModel: DailyDotViewModel){
        self.date = viewModel.date
        self.dotViewModel = viewModel
        self.dayInfo = viewModel.dayRating
        self.repository = repository
        if let day = viewModel.dayRating{
            rating = Double(day.rating)
            dayDescription = day.dayDescription ?? ""
        }
    }
}
