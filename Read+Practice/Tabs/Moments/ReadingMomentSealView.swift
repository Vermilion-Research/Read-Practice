//
//  ReadingMomentSealView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/7/26.
//

import SwiftUI

struct ReadingMomentSealView: View {
    var readingMoment: ReadingMoment
    @State var layout: SealLayout = .standard
    
    var body: some View {
        
        Seal(layout: layout, readingMoment: readingMoment) {
            sealContent()
        }
        
    }
    
    private func contentStack() -> some View {
        VStack(alignment: .leading) {
            Text(readingMoment.title)
                .font(layout.titleFont)
            if !readingMoment.note.isEmpty, !showImage {
                Text(readingMoment.note)
                    .font(layout.bodyFont)
            }
        }
        .frame(maxWidth: layout.size * 0.80)
        .frame(maxHeight: layout.size * (showImage ? 0.15 : 0.50))
        .padding(.bottom, layout.size * layout.textBottomPadding)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var showImage: Bool {
        readingMoment.image != nil
    }
    
    private func sealContent() -> some View {
        ZStack(alignment: .bottom) {
            if showImage {
                Color.clear
                contentStack()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .background(.ultraThinMaterial)
            } else {
                Color.coral
                contentStack()
                    .frame(height: layout.size * 0.80)
            }
            Text(
                readingMoment.timeStamp
                    .formatted(.dateTime.month(.abbreviated).day()))
            .font(.footnote)
            .padding(.bottom, layout.size * 0.80)
            .frame(maxWidth: layout.size / 3)
            .frame(minWidth: layout.timeStampHeight)
            
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ScrollView {
        ReadingMomentSealView(readingMoment: ReadingMoment.imageSample)
        ReadingMomentSealView(
            readingMoment: ReadingMoment.imageSample,
            layout: .large
        )
        ReadingMomentSealView(readingMoment: ReadingMoment.sample)
        ReadingMomentSealView(
            readingMoment: ReadingMoment.imageSample,
            layout: .large
        )
        
    }
}
