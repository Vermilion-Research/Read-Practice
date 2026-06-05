//
//  Read_PracticeApp.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import SwiftData

@main
struct Read_PracticeApp: App {
    let dataContainer = DataContainer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
                
        }
        .modelContainer(dataContainer.modelContainer)
//        .modelContainer(for: [OnboardingVersion.self])
    }
}
