//
//  DayDotView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import SwiftUI

struct DayDotView: View {
    @ObservedObject var viewModel: DayDotViewModel
    var body: some View {
        ZStack{
            if viewModel.hasCurrentDayPassed{
                if let dateInfo = viewModel.dayRating,
                   let emoji = Rating(rawValue: Int(dateInfo.rating)){
                    Text(emoji.emojiReflection)
                }else{
                    Text("+")
                }
            } else{
                Text("\(viewModel.dayInMonth)")
                    .font(.title2)
                    .foregroundStyle(AppColor.primary.color)
            }
        }
        .frame(width: 50, height: 50)
        .background(.gray)
        .cornerRadius(20)
        .shadow(radius: 1)
    }
}

#Preview {
    let stack = CoreDataStackImpl()
    let repo = CoreDataRepositoryImpl<Day>(coreDataStack: stack)
    
    DayDotView(viewModel: DayDotViewModel(date: Date.now, repository: repo))
}
