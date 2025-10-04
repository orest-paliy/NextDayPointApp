//
//  DayDotView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import SwiftUI

struct DayDotView: View {
    @StateObject private var viewModel = DayDotViewModel()
    var body: some View {
        ZStack{
            if viewModel.hasCurrentDayPassed{
                if let emoji = viewModel.dayRating.rating?.emojiReflection {
                    Text(emoji)
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
    DayDotView()
}
