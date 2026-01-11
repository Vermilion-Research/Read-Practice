//
//  ReadingBadgeDetailView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/9/26.
//

import SwiftUI

struct UnlockedBadgeView: View {
    var readingBadge: ReadingBadge
    
    var body: some View {
        NavigationLink {
            ReadingBadgeDetailView(readingBadge: readingBadge)
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                Image(readingBadge.readingBadgeDetails.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(readingBadge.readingBadgeDetails.title)
                    .font(.headline.bold())
                Text(readingBadge.readingBadgeDetails.requirements)
                    .font(.caption2.bold())
                Spacer()
                if let timeStamp = readingBadge.timeStamp {
                    Text(timeStamp, style: .date)
                        .font(.caption2.bold())
                }
                
            }
            .padding()
            .frame(width: 210, height: 225)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.white)
            .background(readingBadge.readingBadgeDetails.color.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            
        }
    }
}

#Preview {
    NavigationStack {
        UnlockedBadgeView(readingBadge: .sample)
    }
}
