//
//  OpenReadingMomentsViewIntent.swift
//  Read+Practice
//
//  Created by Kari Douglas on 5/14/26.
//

import SwiftUI
import AppIntents

struct OpenReadingMomentsViewIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Reading Moments"
    
    static var description = IntentDescription("Opens the app and goes to your current list of reading moments")
    
    static var supportedModes: IntentModes = .background
    
    @MainActor func perform() async throws -> some IntentResult {
//        navigationModel
        return .result()
    }
//    @Dependency
//    private var navigationModel: NavigationModel
}

//enum IntentModes: String {
//    case background
//}
