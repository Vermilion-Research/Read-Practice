//
//  BadgeDetails.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/8/26.
//


import Foundation
import SwiftUI

enum BadgeDetails: Int, Codable, CaseIterable {
    case firstEntry
    case fiveStars
    case shutterBug
    case expressive
    case perfectTen
    
    
    var requirements: String {
        switch self {
        case .firstEntry:
            return "Record first reading moment."
        case .fiveStars:
            return "Record five reading moments."
        case .shutterBug:
            return "Add three reading moments with photos."
        case .expressive:
            return "Add 5 reading moments with a photo and text."
        case .perfectTen:
            return "Record at least 10 reading moments, collecting all other badges along the way "
        }
        
    }
    
    var title: String {
        switch self {
        case .firstEntry:
            return "Start Reading"
        case .fiveStars:
            return "5 Stars"
        case .shutterBug:
            return "Shutter Bug"
        case .expressive:
            return "Expressive"
        case .perfectTen:
            return "Perfect 10"
        }
    }
    
    var image: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryUnlocked
        case .fiveStars:
            return .fiveStarsUnlocked
        case .shutterBug:
            return .shutterbugUnlocked
        case .expressive:
            return .expressiveUnlocked
        case .perfectTen:
            return .perfectTenUnlocked
        }
    }
    
    var lockedImage: ImageResource {
        switch self {
        case .firstEntry:
            return .firstEntryLocked
        case .fiveStars:
            return .fiveStarsLocked
        case . shutterBug:
            return .shutterbugLocked
        case .expressive:
            return .expressiveLocked
        case .perfectTen:
            return .perfectTenLocked
        }
    }
    
    var congratulatoryMessage: String {
        switch self {
        case .firstEntry:
            return "Every single page read is significant on your journey to focus better! Congratulations "
        case .fiveStars:
            return "You’re building momentum!! Reading a page a day isn't that bad huh?"
        case .shutterBug:
            return "Photos connect us to our past, and looking at them takes us back to the feeling we had when we snapped them"
        case .expressive:
            return "5 reading moments with photos! Which entry stands out the most? "
        case .perfectTen:
            return "You're getting accustomed to reading daily and improving your comprehension! Keep it up and see how far it can take you."
        }
    }
    
    
    var color: Color {
        switch self {
        case .firstEntry:
            return .coral
        case .fiveStars:
            return .brick
        case .shutterBug:
            return .oceania
        case .expressive:
            return .deepBlue
        case .perfectTen:
            return .ember
        }
    }
    
}
