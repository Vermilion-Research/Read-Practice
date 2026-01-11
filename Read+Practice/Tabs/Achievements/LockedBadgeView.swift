//
//  LockedBadgeView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/10/26.
//

import SwiftUI

struct LockedBadgeView: View {
    var readingBadge: ReadingBadge
    
    var body: some View {
        HStack {
            Image(readingBadge.readingBadgeDetails.lockedImage)
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.trailing, 16)
            VStack(alignment: .leading, spacing: 8) {
                Text(readingBadge.readingBadgeDetails.title)
                    .font(.subheadline.bold())
                Text(readingBadge.readingBadgeDetails.requirements)
                    .font(.caption)
            }
            Spacer()
        }
        .padding()
        .background(Color.secondary.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    LockedBadgeView(readingBadge: .sample)
        
}
