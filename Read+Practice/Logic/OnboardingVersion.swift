//
//  OnboardingVersion.swift
//  Read+Practice
//
//  Created by Kari Douglas on 2/23/26.
//

import Foundation
import SwiftData

@Model
class OnboardingVersion {
    @Attribute(.unique) var id: String
    var versionNumber: String
    
    init(id: String = "OnboardingVersion", versionNumber: String) {
        self.id = id
        self.versionNumber = versionNumber
    }
}
