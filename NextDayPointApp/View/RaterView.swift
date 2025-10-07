//
//  DayRaterView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import SwiftUI

struct RaterView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel: RaterViewModel<CoreDataRepository<Day>>
    var dayRating: Day?
    var body: some View {
        Section(content: {
            RatingSliderView(value: $viewModel.rating)
            dayDescriporView()
            Spacer()
            Button(viewModel.dayInfo == nil ? "Add" : "Edit", action: {
                //TODO: Add save or edit in DB
                viewModel.saveInfo()
                coordinator.sheet = nil
            })
            .padding()
            .frame(maxWidth: .infinity)
            .background(.yellow)
            .foregroundStyle(.black)
            .cornerRadius(20)
            .fontWeight(.medium)
            .padding()
        }, header: {
            Label("Day rating view", systemImage: "chart.line.uptrend.xyaxis")
                .font(.title2)
        })
        .padding(.top)
    }
    
    
    @ViewBuilder
    func dayDescriporView() -> some View{
        TextField("Day description (optional)", text: $viewModel.dayDescription)
            .textFieldStyle(.plain)
            .padding()
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(style: StrokeStyle(dash: [10, 5]))
            })
            .padding(.horizontal)
        
    }
}

#Preview {
//    RaterView(viewModel: RaterViewModel(repository: CoreDataRepository(), viewModel: DailyDotViewModel(date: Date.now, dayRating: nil)))
}
