//
//  RatinSliderView.swift
//  NextDayPointApp
//
//  Created by Orest Palii on 06.10.2025.
//

import SwiftUI

struct RatingSliderView: View {
    @Binding var value: Double
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Rate your day")
                Spacer()
                Text("Selected \(Rating(rawValue: Int(value))!.emojiReflection)")
            }
            Slider(value: $value,
                    in: 1...10,
                    step: 1,
                    minimumValueLabel: Text("😡"),
                    maximumValueLabel: Text("🤩"),
                    label: {
                        Text("")
                    }
                )
            .tint(.yellow)
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: .init(dash: [10, 5]))
        }
        .padding()
    }
}

#Preview {
    RatingSliderView(value: .constant(5))
}
