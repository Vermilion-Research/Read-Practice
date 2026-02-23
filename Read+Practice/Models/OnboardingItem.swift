//
//  OnboardingItem.swift
//  Read+Practice
//
//  Created by Kari Douglas on 2/20/26.
//

import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let systemImageName: String
    let title: String
    let subtitle: String
}
