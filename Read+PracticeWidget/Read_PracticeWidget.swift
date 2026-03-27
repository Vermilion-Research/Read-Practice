//
//  Read_PracticeWidget.swift
//  Read+PracticeWidget
//
//  Created by Kari Douglas on 3/22/26.
//

import WidgetKit
import SwiftUI
//import SwiftData

struct ReadStreakEntry: TimelineEntry {
    let date: Date
//    private var readingMoments: [ReadingMoment]
//    let streak: StreakView
}
//
//struct StreakProvider: TimelineProvider {
//    typealias Entry =  ReadStreakEntry
//
//    
//    func placeholder(in context: Context) -> some ReadStreakEntry {
//        ReadStreakEntry(date: Date())
//    }
//}

struct ReadStreakWidgetEntryView: View {
//     var readingMoments: [ReadingMoment]
    
    var body: some View {
        Text("hello")
//        StreakView(numberOfDays: 4)
//        StreakView(
//            numberOfDays: StreakCalculator()
//                .calculateStreak(for: readingMoments)
//        )
    }
}
//
#Preview {
    ReadStreakWidgetEntryView()
}
