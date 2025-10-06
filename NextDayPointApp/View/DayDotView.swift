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
                        .foregroundStyle(viewModel.hasCurrentDayPassed ? .black : .white)
                }
            } else{
                Text("\(viewModel.dayInMonth)")
                    .foregroundStyle(AppColor.primary.color)
            }
        }
        .frame(width: 35, height: 35)
        .background(viewModel.hasCurrentDayPassed ? .yellow : .gray)
        .cornerRadius(15)
        .overlay{
            RoundedRectangle(cornerRadius: 15, style: .circular)
                .stroke()
        }
    }
}

