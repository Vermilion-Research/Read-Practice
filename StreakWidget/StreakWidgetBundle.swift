//
//  StreakWidgetBundle.swift
//  StreakWidget
//
//  Created by Kari Douglas on 3/25/26.
//

import WidgetKit
import SwiftUI


@main
struct StreakWidgetBundle: WidgetBundle {
    var body: some Widget {
        StreakWidget()
        StreakWidgetControl()
        StreakWidgetLiveActivity()
    }
    
        
}
