//
//  ContentView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    

    var body: some View {
        TabView {
            Tab("Reading Moment", image: "MomentsTab") {
                ReadingMomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill") {
                AchievementsView()
            }
        }
        .padding()
    }

   
}

#Preview {
    ContentView()
        .sampleDataContainer()
        
}
