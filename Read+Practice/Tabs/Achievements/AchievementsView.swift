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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                contentStack
            }
            .navigationTitle("Achievements")
        }
    }
    
    private var contentStack: some View {
        VStack{
            header("Unlocked Badges")
            ForEach(sortedUnlockedReadingBadges) { readingBadge in
                Text(readingBadge.readingBadgeDetails.title)
            }
            header("Locked Badges" )
            ForEach(sortedLockedReadingBadges) { readingBadge in
                Text(readingBadge.readingBadgeDetails.title)
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
