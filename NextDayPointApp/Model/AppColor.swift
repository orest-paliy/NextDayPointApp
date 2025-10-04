//
//  AppColor.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import SwiftUI

enum AppColor: String{
    case primary = "AppPrimaryColor"
    
    var color: Color{
        Color(self.rawValue)
    }
}
