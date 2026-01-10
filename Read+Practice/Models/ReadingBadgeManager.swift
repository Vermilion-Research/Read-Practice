//
//  ReadingBadgeManager.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/9/26.
//

import Foundation
import SwiftData

class ReadingBadgeManager {
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
}
