//
//  MonthPickerView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 05.10.2025.
//

import SwiftUI

struct MonthPickerView: View {
    @StateObject private var dayStorage = DayStorage()
    @StateObject private var viewModel = MonthPickerViewModel()
    @State private var isIncreasingMonths = false
    var body: some View {
        VStack{
            HStack{
                selectedMonthChanger(up: false)
                Text("\(viewModel.currentMonth) \(String(viewModel.currentYearIdx))")
                    .padding()
                    .italic()
                    .cornerRadius(30)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 30, style: .circular)
                            .stroke(lineWidth: 1)
                    })
                selectedMonthChanger(up: true)
            }
            
            //Mock of grid
            CalendarGridView(dayStorage: dayStorage, viewModel: CalendarGridViewModel(month: viewModel.currentMonthIdx, year: viewModel.currentYearIdx, storage: dayStorage))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.gray.tertiary)
                .cornerRadius(30)
                .contentTransition(.interpolate)
                .id(viewModel.id)
                .transition(pushTransition(isNewer: isIncreasingMonths))
                .onChange(of: viewModel.id, {
                    loadStorage()
                })
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 40, style: .circular)
                .stroke(style: .init(dash: [10, 5]))
        }
        .onAppear{
            loadStorage()
        }
        .padding()
        
        SectorChartView(storage: dayStorage)
            .id(viewModel.id)
            .transition(.scale)
    }
    
    private func loadStorage(){
            dayStorage.loadAllRatingsFor(month: viewModel.currentMonthIdx, year: viewModel.currentYearIdx)
    }
    
    private func pushTransition(isNewer: Bool) -> AnyTransition {
        let insertEdge: Edge = isNewer ? .trailing : .leading
        let removeEdge: Edge = isNewer ? .leading  : .trailing
        return .asymmetric(
            insertion: .move(edge: insertEdge).combined(with: .scale),
            removal: .move(edge: removeEdge).combined(with: .scale).combined(with: .opacity),
        )
    }
}

//MARK: Additional Views
extension MonthPickerView{
    func selectedMonthChanger(up: Bool) -> some View {
        Image(systemName: "arrow\(up ? ".right" : ".left")")
            .frame(width: 50, height: 50)
            .background(.yellow)
            .cornerRadius(30)
            .imageScale(.large)
            .shadow(color: .yellow, radius: 2)
            .overlay{
                RoundedRectangle(cornerRadius: 30, style: .circular)
                    .stroke(lineWidth: 1)
            }
            .onTapGesture {
                withAnimation(.bouncy){
                    viewModel.changeMonth(increase: up)
                    isIncreasingMonths = up
                }
            }
    }
}

#Preview {
    MonthPickerView()
}
