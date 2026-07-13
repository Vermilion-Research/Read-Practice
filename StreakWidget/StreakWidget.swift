//
//  StreakWidget.swift
//  StreakWidget
//
//  Created by Kari Douglas on 3/25/26.
//

import WidgetKit
import SwiftUI
import SwiftData


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
        completion(entry)
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
        completion(timeline)
        
    }
}

struct StreakWidgetEntryView: View {
    var entry: StreakViewProvider.Entry
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    
    @ViewBuilder var body: some View  {
        let content = VStack {
            StreakView(
                numberOfDays: StreakCalculator()
                    .calculateStreak(for: readingMoments)
            )
            .modelContext(self.modelContext)
            
//                        .frame(maxWidth: .infinity)
            //            .containerBackground(.fill.tertiary, for: .widget)
        }
        if #available(iOS 18.0, macOS 26.0, watchOS 26.4, *){
            content.containerBackground(.fill.tertiary, for: .widget)
        } else {
            content.background(Color.clear)
        }
    }
}

struct StreakWidget: Widget {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    let kind: String = "StreakWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: StreakViewProvider()) { entry in
            let base = StreakWidgetEntryView(entry: entry)
                .modelContainer(for: ReadingMoment.self)

            if #available(iOS 18.0, macOS 26.0, watchOS 26.4, *){
                base.containerBackground(.fill.tertiary, for: .widget)
            } else {
                base.background(Color.clear)
            }

        }
        .configurationDisplayName("Reading Moments Streak View (Readdy App)")
        .description("See how well you're keeping up with your reading habit. ")
    }
        
}



