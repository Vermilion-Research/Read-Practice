//
//  Read_PracticeTests.swift
//  Read+PracticeTests
//
//  Created by Kari Douglas on 1/12/26.
//

import Testing
@testable import Read_Practice
import Foundation

struct StreakCalculatorTests {
    let streakCalculator = StreakCalculator()
    let now = Date.now
    
    struct Input {
        let expectedStreak: Int
        let days: [Int]
    }

    @Test("Streak Calculations", arguments: [
        Input(expectedStreak: 0, days: []),

        Input(expectedStreak: 1, days: [0]),

        Input(expectedStreak: 1, days: [-1]),

        Input(expectedStreak: 0, days: [-2]),

        Input(expectedStreak: 1, days: [0, 0]),

        Input(expectedStreak: 1, days: [-1, -1]),

        Input(expectedStreak: 0, days: [-2, -2]),

        Input(expectedStreak: 3, days: [-2, -1, 0]),

        Input(expectedStreak: 2, days: [-3, -1, 0]),

        Input(expectedStreak: 3, days: [-3, -2, -1]),

        Input(expectedStreak: 2, days: [-4, -2, -1]),
    
    ])
    
    func testCalculations(input: Input) {
      
        let readingMoments = input.days.map {
            let date = Calendar.current.date(byAdding: .day, value: $0, to: now)!
            return ReadingMoment(title: "", note: "", timeStamp: date)
        }
        
        let streak = streakCalculator.calculateStreak(for: readingMoments)
        #expect(streak == input.expectedStreak, "\(input.days)")
    }

}
