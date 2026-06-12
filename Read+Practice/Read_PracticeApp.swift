//
//  Read_PracticeApp.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import SwiftData
import AppIntents


@main
struct Read_PracticeApp: App {
    @MainActor
    static let sharedDataContainer = DataContainer()
    
    init() {
        
        AppDependencyManager.shared
            .add(
                key: "ModelContainer",
                dependency: Read_PracticeApp.sharedDataContainer
                    .modelContainer)
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Read_PracticeApp.sharedDataContainer
                )
        }
        .modelContainer(Read_PracticeApp.sharedDataContainer
            .modelContainer)
    }
}
