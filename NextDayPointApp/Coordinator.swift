//
//  Coordinator.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import Foundation
import SwiftUI
import Combine

final class Coordinator: ObservableObject{
    @Published var path = NavigationPath()
    @Published var isSheetPresented: Bool = false
    
    func push(page: AppPage){
        path.append(page)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func removeAll(){
        path.removeLast(path.count-1)
    }
}
