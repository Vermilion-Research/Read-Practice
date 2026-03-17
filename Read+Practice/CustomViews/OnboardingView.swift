//
//  OnboardingView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 2/24/26.
//

import SwiftUI
import SwiftData

struct OnboardingView: View {
    let dismissOnboardingView: () -> Void
    @State private var selectedView = 1
    @State private var lastOnboardingScreen = 3
    
    var body: some View {
        VStack {
            TabView(selection: $selectedView) {
                OnboardingScreen(
                    item: OnboardingItem(
                        systemImageName: "book.pages",
                        title: "Read + Practice",
                        subtitle: "Read first then come back here"
                    )
                ).tag(1)
                OnboardingScreen(
                    item: OnboardingItem(systemImageName: "long.text.page.and.pencil.fill", title: "Document what you read", subtitle: "Leave a two sentence summary. You can also take a picture of the page you read")
                ).tag(2)
                OnboardingScreen(
                    item: OnboardingItem(systemImageName: "bolt.badge.checkmark", title: "Get Achievements", subtitle: "Get badges for achieving important reading milestones. ")
                ).tag(3)
                
            }
           
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            Button(selectedView == lastOnboardingScreen ? "Done" : "Next" ) {
                if selectedView == lastOnboardingScreen {
                    dismissOnboardingView()
                } else {
                    selectedView += 1
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical)
            
        }
    }
}

#Preview {
    OnboardingView(dismissOnboardingView: {})
}
