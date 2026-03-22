//
//  OnboardingItem.swift
//  Read+Practice
//
//  Created by Kari Douglas on 2/20/26.
//

import Foundation
import SwiftData


@Model
class OnboardingItem: Identifiable {
    var id = UUID()
    var systemImageName: String
    var title: String
    var subtitle: String
    
    init(
        id: UUID = UUID(),
        systemImageName: String,
        title: String,
        subtitle: String
    ) {
        self.id = id
        self.systemImageName = systemImageName
        self.title = title
        self.subtitle = subtitle
    }
}
