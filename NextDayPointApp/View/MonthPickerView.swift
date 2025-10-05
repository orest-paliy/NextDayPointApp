//
//  MonthPickerView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 05.10.2025.
//

import SwiftUI

struct MonthPickerView: View {
    @StateObject var viewModel = MonthPickerViewModel()
    var body: some View {
        VStack{
            HStack{
                selectedMonthChanger(up: false)
                Text(viewModel.selectedMonth)
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
            ZStack{}
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .padding()
                .background(.gray.tertiary)
                .cornerRadius(30)
                .contentTransition(.interpolate)
                .id(viewModel.idForTransition)
                .transition(pushTransition(isNewer: viewModel.isSelectedMonthNewer))
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 40, style: .circular)
                .stroke(style: .init(dash: [10, 5]))
        }
        .padding()
    }
    
    private func pushTransition(isNewer: Bool) -> AnyTransition {
        let insertEdge: Edge = isNewer ? .leading : .trailing
        let removeEdge: Edge = isNewer ? .trailing  : .leading
        return .asymmetric(
            insertion: .move(edge: insertEdge).combined(with: .opacity),
            removal: .move(edge: removeEdge).combined(with: .opacity)
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
                    viewModel.changeSelectedMonth(up: up)
                }
            }
    }
}

#Preview {
    MonthPickerView()
}
