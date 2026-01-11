//
//  Seal.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/7/26.
//

import SwiftUI

struct Seal<Content: View>: View {
    private let borderWidth = 2.0
    var borderColor: Color = .coral
    var layout: SealLayout = .standard
    var readingMoment: ReadingMoment? = nil
    @ViewBuilder var content: () -> Content
    
    
    var body: some View {
        ZStack {
            if let background = readingMoment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask {
            Image(systemName: "seal.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size - borderWidth, height: layout.size - borderWidth)
        }
        .background {
            Image(systemName: "seal")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: layout.size, height: layout.size)
                .foregroundStyle(borderColor)
        }
        .frame(width: layout.size, height: layout.size)
        .overlay(alignment: .topTrailing){
            if let readingMoment {
                SealAccessoryView(
                    readingMoment: readingMoment,
                    sealLayout: layout
                )
            }
        }
    }
}

#Preview {
    
    Seal(readingMoment: ReadingMoment.imageSample) {
        
        Text(ReadingMoment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
