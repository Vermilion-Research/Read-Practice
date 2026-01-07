//
//  SealLayout.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/7/26.
//

import Foundation

enum SealLayout {
    case standard
    case large
    
    var size: CGFloat {
        switch self {
        case .standard:
            return 200.0
            
        case .large:
            return 350.0
        }
    }
}
