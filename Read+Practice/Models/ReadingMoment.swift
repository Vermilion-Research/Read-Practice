//
//  ReadingMoment.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import Foundation
import SwiftData
import UIKit

@Model
class ReadingMoment {
    var title: String
    var note: String
    var imageData: Data?
    var timeStamp: Date
//    var cameraImage: UIImage?
    
    var readingBadges: [ReadingBadge]
    
    
    init(
        title: String,
        note: String,
        imageData: Data? = nil,
        timeStamp: Date = .now
    ) {
        self.title = title
        self.note = note
        self.imageData = imageData
        self.timeStamp = timeStamp
        self.readingBadges = []
        
    }
    
    var image: UIImage? {
        imageData.flatMap {
            UIImage(data: $0)
        }
    }
    
}

// has sample data for Reading moment
extension ReadingMoment {

    static let sample = sampleData[0]

    static let longTextSample = sampleData[1]

    static let imageSample = sampleData[4]



    static let sampleData = [

        ReadingMoment(

            title: "🍅🥳",

            note: "Picked my first homegrown tomato!"

        ),

        ReadingMoment(

            title: "Passed the test!",

            note: "The chem exam was tough, but I think I did well 🙌 I’m so glad I reached out to Guillermo and Lee for a study session. It really helped!",

            imageData: UIImage(named: "Study")?.pngData()

        ),

        ReadingMoment(

            title: "Down time",

            note: "So grateful for a relaxing evening after a busy week.",

            imageData: UIImage(named: "Relax")?.pngData()

        ),

        ReadingMoment(

            title: "Family ❤️",

            note: ""

        ),

        ReadingMoment(

            title: "Rock on!",

            note: "Went to a great concert with Blair 🎶",

            imageData: UIImage(named: "Concert")?.pngData()

        )

    ]

}

