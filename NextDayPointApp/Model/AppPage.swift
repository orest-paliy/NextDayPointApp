//
//  AppPages.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import SwiftUI

enum AppPage{
    case main, chart
    
    @ViewBuilder
    var view: some View{
        switch self{
        case .main:
            MonthPickerView()
        case .chart:
            Text("")
        }
    }
}
