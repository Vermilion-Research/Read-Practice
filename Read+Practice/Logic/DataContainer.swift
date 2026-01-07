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
    
    let modelContainer : ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            ReadingMoment.self
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
            
            if includeSampleMoments {
                loadSampleMoments()
            }
            try context.save()
            
        } catch {
            
            fatalError("Could not create ModelContainer: \(error)")
        }
    
    }
    
    private func loadSampleMoments() {
        
        for readingMoment in ReadingMoment.sampleData {
            context.insert(readingMoment)
        }
    }
}

private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
