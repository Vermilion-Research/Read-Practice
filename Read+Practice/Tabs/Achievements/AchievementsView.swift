//
//  AchievementsView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/10/26.
//

import SwiftUI
import SwiftData

struct AchievementsView: View {
    @Query(filter: #Predicate<ReadingBadge> {$0.timeStamp != nil })
    private var unlockedReadingBadges: [ReadingBadge]
    
    @Query(filter: #Predicate<ReadingBadge> {$0.timeStamp == nil})
    private var lockedReadingBadges: [ReadingBadge]
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading){
            StreakView(
                numberOfDays: StreakCalculator()
                    .calculateStreak(for: readingMoments)
            )
            .frame(maxWidth: .infinity)
            if !unlockedReadingBadges.isEmpty {
                header("Unlocked Badges")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(sortedUnlockedReadingBadges) { readingBadge in
                            UnlockedBadgeView(readingBadge: readingBadge)
                        }
                    }
                }
                .scrollClipDisabled()
                .scrollIndicators(.hidden)
            }
            if !lockedReadingBadges.isEmpty {
                header("Locked Badges" )
                ForEach(sortedLockedReadingBadges) { readingBadge in
                    LockedBadgeView(readingBadge: readingBadge)
                }
            }
            }
        .padding()
        .frame(maxWidth: .infinity)
        
    }
    
    func header(_ text: String) -> some View {
        Text(text)
            .font(.subheadline.bold())
            .padding()
    }
    private var sortedLockedReadingBadges: [ReadingBadge] {
        lockedReadingBadges.sorted {
            $0.readingBadgeDetails.rawValue < $1.readingBadgeDetails.rawValue
        }
    }
    /// -precondition `unlockedReadingBadges` must have a timestamp
    private var sortedUnlockedReadingBadges: [ReadingBadge] {
        unlockedReadingBadges.sorted {
            ($0.timeStamp!, $0.readingBadgeDetails.title) < (
                $1.timeStamp!,
                $1.readingBadgeDetails
                    .title)
        }
    }
}

#Preview {
    AchievementsView()
        .sampleDataContainer()
}
