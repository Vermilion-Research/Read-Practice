//
//  DataContainer.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    
    let modelContainer: ModelContainer
    var readingBadgeManager: ReadingBadgeManager
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            ReadingMoment.self,
            ReadingBadge.self,
            OnboardingVersion.self
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: includeSampleMoments
        )
        do {
            modelContainer = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            readingBadgeManager = ReadingBadgeManager(
                modelContainer: modelContainer
            )
            
            try readingBadgeManager.loadReadingBadgesIfNeeded()
            
            if includeSampleMoments {
               try loadSampleMoments()
            }
            try context.save()
            
        } catch {
            
            fatalError("Could not create ModelContainer: \(error)")
        }
    
    }
    
    private func loadSampleMoments() throws {
        
        for readingMoment in ReadingMoment.sampleData {
            context.insert(readingMoment)
            try readingBadgeManager
                .unlockBadges(newReadingMoment: readingMoment)
        }
    }
}
@MainActor
private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
