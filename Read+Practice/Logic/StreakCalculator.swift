//
//  StreakCalculator.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/11/26.
//
import Foundation

class StreakCalculator {
    
    let calendar = Calendar.current
    
    // counts number of days a readingMoment has been recorded
    
    // days are are measured from end of the day and not the current time
    /// - precondition: `moments` must be sorted by timestamp, from earliest to latest
    func calculateStreak(for readingMoment: [ReadingMoment]) -> Int {
        let startOfToday =  calendar.startOfDay(for: .now)
        let endOfDay = calendar.date(
            byAdding: DateComponents(day: 1, second:  -1 ),
            to: startOfToday
        )!
        
        
        // Ex. [0, 0, 1, 2, 4, 5]
        let daysAgoArray = readingMoment.reversed()
            .map(\.timeStamp)
            .map { calendar.dateComponents([.day], from: $0, to: endOfDay)
            }
            .compactMap { $0.day}
        print(daysAgoArray)
        
        var streak = 0
        for daysAgo in daysAgoArray {
            if daysAgo == streak {
//             Streak present; don't increase streak
//            5 posts in one day is a 1 day streak, 5 posts in 2 days is a two day streak
                continue
            } else if daysAgo == streak + 1 {
//          A readingMoment exists the day after the current streak; add one to streak
                streak += 1
                print("Increase streak to \(streak)")
            } else {
               // streak breaks if jumping more than one day
                break
            }
            
        }
        
        if daysAgoArray.first == 0 {
            streak += 1
        }
        return streak
    }
}
