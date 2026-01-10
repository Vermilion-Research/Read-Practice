//
//  ReadingBadgeDetailView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/9/26.
//

import SwiftUI

struct ReadingBadgeDetailView: View {
    var readingBadge: ReadingBadge
    
    var body: some View {
        VStack(spacing: 8) {
            Image(readingBadge.readingBadgeDetails.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            Text(readingBadge.readingBadgeDetails.title)
                .font(.title.bold())
            Text(readingBadge.readingBadgeDetails.congratulatoryMessage)
                .font(.body)
            Spacer()
               
        }
        .padding()
        .frame(width: 320, height: 410)
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .background(readingBadge.readingBadgeDetails.color.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    ReadingBadgeDetailView(readingBadge: .sample)
}
