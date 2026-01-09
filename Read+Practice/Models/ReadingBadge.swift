//
//  ReadingBadge.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/8/26.
//

import Foundation
import SwiftData

// this will store information for a particular user
@Model
class ReadingBadge {
    
    var readingBadgeDetails: BadgeDetails
    
    init(readingBadgeDetails: BadgeDetails) {
        self.readingBadgeDetails = readingBadgeDetails
    }
    
}


extension ReadingBadge {
    static var sample: ReadingBadge {
        let readingBadge = ReadingBadge(readingBadgeDetails: .firstEntry)
        return readingBadge
    }
}
