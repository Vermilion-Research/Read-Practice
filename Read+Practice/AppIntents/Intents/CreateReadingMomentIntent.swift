//
//  CreateReadingMomentIntent.swift
//  Read+Practice
//
//  Created by Kari Douglas on 5/13/26.
//

import SwiftUI
import AppIntents
import SwiftData
import WidgetKit

struct CreateReadingMomentIntent: AppIntent {

    static var title: LocalizedStringResource = "Create a Reading Moment"
    static var description: IntentDescription? = IntentDescription("Add a title and a two sentence note. ")
    
    @Parameter(title: "Title", requestValueDialog:   "What did you read?")
    var newReadingMomentTitle: String
    @Parameter(title: "Summary", requestValueDialog: "Give a 2 sentence summary")
    var newReadingMomentNote: String
    
    @Dependency(key: "ModelContainer")
    private var modelContainer: ModelContainer

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> {
        let context = ModelContext(modelContainer)
        
        let newReadingMoment = ReadingMoment(
            title: newReadingMomentTitle,
            note: newReadingMomentNote
        )
        context.insert(newReadingMoment)
        
        try context.save()
        
        WidgetCenter.shared.reloadAllTimelines()
        
        return .result(value: "Added \(newReadingMomentTitle)!")
    }
    
    init() {}
    
}
