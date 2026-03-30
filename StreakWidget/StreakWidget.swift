//
//  StreakWidget.swift
//  StreakWidget
//
//  Created by Kari Douglas on 3/25/26.
//

import WidgetKit
import SwiftUI
import SwiftData

////    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
////        // Generate a list containing the contexts this widget is relevant in.
////    }

struct StreakEntry: TimelineEntry {
    let date: Date
    let streak: StreakView
}

struct StreakViewProvider: TimelineProvider {
    
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    
    func placeholder(in context: Context) -> StreakEntry {
        StreakEntry(
            date: Date(),
            streak: StreakView(
                numberOfDays: StreakCalculator().calculateStreak(for: readingMoments)
            )
        )
    }
    
    func getSnapshot(
        in context: Context,
        completion: @escaping (StreakEntry) -> Void
    ) {
        let entry = StreakEntry(
            date: Date(),
            streak: StreakView(
                numberOfDays: StreakCalculator()
                    .calculateStreak(for: readingMoments)
            )
        )
    }
    
    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<StreakEntry>) -> Void
    ) {
        let entry = StreakEntry(
            date: Date(),
            streak: StreakView(
                numberOfDays: StreakCalculator()
                    .calculateStreak(for: readingMoments)
            )
        )
        let timeline = Timeline(
            entries: [entry],
            policy: .after(Date().addingTimeInterval(3600))
        )
    }
}


struct StreakWidget: Widget {
    let kind: String = "StreakWidget"
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: StreakViewProvider()) { entry in
            StreakView(
                numberOfDays: StreakCalculator()
                    .calculateStreak(for: readingMoments)
            )
            .frame(maxWidth: .infinity)
            .containerBackground(.fill.tertiary, for: .widget)
        } 
    }
}


