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
    
    init() {}
    
    init(_ newReadingMomentTitle: String, _ newReadingMomentNote: String) {
        self.newReadingMomentTitle = newReadingMomentTitle
        self.newReadingMomentNote = newReadingMomentNote
    }
//    var newReadingMoment: ReadingMomentEntity
//    var note: String
    
    func perform() async throws -> some IntentResult {
//        let addMoment = await addNewReadingMoment(title: title, note: note)
//        await addNewReadingMoment()
        return .result()
    }
    
    @MainActor func addNewReadingMoment() {
        let container = try! ModelContainer(for: ReadingMoment.self)
        let newReadingMoment = ReadingMoment(
            title: newReadingMomentTitle,
            note: newReadingMomentNote,
            timeStamp: .now
        )
        container.mainContext.insert(newReadingMoment)
        
    }
}
