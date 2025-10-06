//
//  DayRaterView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import SwiftUI

struct DayRaterView: View {
    @State var rating: Double = 5
    @State var dayDescription: String = ""
    @EnvironmentObject var coordinator: Coordinator
    var dayRating: Day?
    var body: some View {
        Section(content: {
            RatingSliderView(value: $rating)
            dayDescriporView()
            Spacer()
            Button("Add", action: {
                //TODO: Add save or edit in DB
                coordinator.isSheetPresented = false
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
        .onAppear{
            if let dayRating{
                rating = Double(dayRating.rating)
                dayDescription = dayRating.description
            }
        }
    }
    
    
    @ViewBuilder
    func dayDescriporView() -> some View{
        TextField("Day description (optional)", text: $dayDescription)
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
    DayRaterView()
}
