//
//  SealAccessoryView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/11/26.
//

import SwiftUI

struct SealAccessoryView: View {
    var readingMoment: ReadingMoment
    var sealLayout: SealLayout
    
    var body: some View {
        NavigationLink {
            if readingBadges.count == 1 {
                ReadingBadgeDetailView(readingBadge: readingBadges[0])
            } else {
                ReadingMomentDetailView(readingMoment: readingMoment)
            }
        } label: {
            readingBadgeView
        }
    }
    
    private var readingBadgeView: some View {
        Group {
            if readingBadges.count > 1 {
                Text("+ \(readingBadges.count)")
                    .bold()
                    .frame(width: size * 0.5, height: size * 0.5)
                    .padding(8)
                    .background {
                        Image("Blank")
                            .resizable()
                            .frame(width: size, height: size)
                            .shadow(radius: 2)
                    }
                    .foregroundStyle(.gray)
            } else if let readingBadge = readingBadges.first {
                Image(readingBadge.readingBadgeDetails.image)
                    .resizable()
                    .frame(width: size, height: size)
                    .shadow(radius: 0.2)
            }
        }
        .offset(y: offset)
    }
    private var offset: CGFloat {
        let radius = sealLayout.size / 2
        
        let yOffsetFromSealCenter = sin(Angle.degrees(50).radians) * radius
        
        return radius - yOffsetFromSealCenter - (size / 2)
    }
    
    private var size: CGFloat {
        sealLayout.size / 5
    }
    
    private var readingBadges: [ReadingBadge] {
        readingMoment.readingBadges
    }
}

#Preview("Single Badge") {
    ReadingMomentSealView(readingMoment: .sample, layout: .large)
        .sampleDataContainer()
}


#Preview("Multiple badges") {
    ReadingMomentSealView(readingMoment: .sample, layout: .large)
        .sampleDataContainer()
}
