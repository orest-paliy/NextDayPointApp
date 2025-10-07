//
//  DayRating.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 04.10.2025.
//

import Foundation
import SwiftUI

enum Rating: Int, CaseIterable{
    case terrible = 1, awful, veryBad, bad, average, fair, good, veryGood, excellent, perfect
    
    //Emoji reflection of day rating
    var emojiReflection: String{
        switch self{
        case .terrible: "💀"
        case .awful: "😡"
        case .veryBad: "😞"
        case .bad: "☹️"
        case .average: "😐"
        case .fair: "🙂"
        case .good: "😊"
        case .veryGood: "😃"
        case .excellent: "🤩"
        case .perfect: "🌟"
        }
    }
    
    var colorReflection: Color {
        switch self {
        case .terrible:
            return .black
        case .awful:
            return .red
        case .veryBad:
            return .orange
        case .bad:
            return .brown
        case .average:
            return .gray
        case .fair:
            return .yellow
        case .good:
            return .mint
        case .veryGood:
            return .teal
        case .excellent:
            return .blue
        case .perfect:
            return .green
        }
    }
}

//extension of Day:NsManagedObject in Core Data
extension Day{
    var visualRating: Rating? {
        Rating(rawValue: Int(self.rating))
    }
}
