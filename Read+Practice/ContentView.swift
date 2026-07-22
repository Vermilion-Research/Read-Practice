//
//  ContentView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var onboardingVersion: [OnboardingVersion]
    @State private var isShowingOnboarding = false
    let currentOnboardingVersion = "1.0.0"
    
    var body: some View {
        TabView {
            Tab("Reading Moment", image: "MomentsTab") {
                ReadingMomentsView()
            }
            Tab("Achievements", systemImage: "medal.fill") {
                AchievementsView()
            }
//            Tab("Settings", systemImage: "globe") {
//                SettingsView()
//            }
        }
        .padding()
        .fullScreenCover(
            isPresented: $isShowingOnboarding,
            content: {
                OnboardingView(
                    dismissOnboardingView: {
                        modelContext
                            .insert(
                                OnboardingVersion(
                                    versionNumber: currentOnboardingVersion
                                )
                            )
                        isShowingOnboarding.toggle()
                    })
            })
        .onAppear {
            isShowingOnboarding = shouldShowOnboarding()
            
        }
    }
    
    func shouldShowOnboarding() -> Bool {
        if let onboarding = onboardingVersion.first, currentOnboardingVersion == onboarding.versionNumber {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    ContentView()
        .sampleDataContainer()
    
}

#Preview("Dark Mode") {
    ContentView()
        .sampleDataContainer()
        .preferredColorScheme(.dark)
}
