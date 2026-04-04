//
//  StreakView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/11/26.
//

import SwiftUI

struct StreakView: View {
    var numberOfDays: Int
    
    
    var body: some View {
        Seal(borderColor: .secondary) {
            VStack(spacing: 5) {
                Text("Streak \(Image(systemName: "flame.fill"))")
                    .foregroundStyle(.ember)
                Text(attributedText)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                

            }
            .font(.callout)
            
        }
       
    }
    
    var attributedText: AttributedString {
        var attributedString = AttributedString(localized: "^[\(numberOfDays) \nDays](inflect: true)")
        if let range = attributedString.range(of: "\(numberOfDays)") {
            attributedString[range].font = .system(size: 55)
        }
        return attributedString
    }
}

#Preview {
    StreakView(numberOfDays: 0)
    StreakView(numberOfDays: 1)
    StreakView(numberOfDays: 23)
}
