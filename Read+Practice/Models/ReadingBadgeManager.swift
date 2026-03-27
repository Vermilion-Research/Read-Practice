//
//  ReadingBadgeManager.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/9/26.
//

import Foundation
import SwiftData

@MainActor
final class ReadingBadgeManager {
    private var modelContainer: ModelContainer
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
    }
    
    func loadReadingBadgesIfNeeded () throws {
        let context = modelContainer.mainContext
        
        var fetchDescriptor = FetchDescriptor<ReadingBadge>()
        fetchDescriptor.fetchLimit = 1
        let existingBadges = try context.fetch(fetchDescriptor)
        
        if existingBadges.isEmpty {
            for details in BadgeDetails.allCases {
                context.insert(ReadingBadge(readingBadgeDetails: details))
            }
        }
    }
    
    func unlockBadges(newReadingMoment: ReadingMoment) throws {
        let context = modelContainer.mainContext
        let readingMoments = try context.fetch(FetchDescriptor<ReadingMoment>())
        let lockedReadingBadges = try context.fetch(
            FetchDescriptor<ReadingBadge
            >(predicate: #Predicate { $0.timeStamp == nil}))
        
        var newlyUnlocked: [ReadingBadge] = []
        for readingBadge in lockedReadingBadges {
            switch readingBadge.readingBadgeDetails {
            case .firstEntry where readingMoments.count >= 1,
                    .fiveStars where readingMoments.count >= 5,
                    .shutterBug where readingMoments.count(where: { $0.image != nil } ) >= 3,
                    .expressive where readingMoments
                    .count(where: { $0.image != nil && !$0.note.isEmpty}) >= 5,
                    .perfectTen where readingMoments.count >= 10 && lockedReadingBadges.count == 1:
                newlyUnlocked.append(readingBadge)
            default:
                continue
            }
        }
        
        for readingBadge in newlyUnlocked {
            readingBadge.readingMoment = newReadingMoment
            readingBadge.timeStamp = newReadingMoment.timeStamp
        }
    }
}
