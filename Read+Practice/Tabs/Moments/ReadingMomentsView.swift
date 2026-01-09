//
//  ReadingMomentsView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import SwiftData

struct ReadingMomentsView: View {
    @State private var showCreateReadingMoment: Bool = false
    @Query(sort: \ReadingMoment.timeStamp)
    private var readingMoments: [ReadingMoment]
    static let offSetAmount: CGFloat = 70.0
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                pathItems
                    .frame(maxWidth: .infinity)
            }
            .overlay {
                if readingMoments.isEmpty {
                    ContentUnavailableView {
                        Label("No reading moments yet", systemImage: "exclamationmark.circle.fill")
                        
                    } description: {
                        Text("Add a note about your most recent 1 page reading")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateReadingMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateReadingMoment) {
                        MomentEntryView()
                    }
                }
            }
            .defaultScrollAnchor(.bottom, for: .initialOffset)
            .defaultScrollAnchor(.bottom, for: .sizeChanges)
            .defaultScrollAnchor(.top, for: .alignment)
            .navigationTitle("Reading Moments")
        }
        
    }
    
   private var pathItems: some View {
       
       ForEach(readingMoments.enumerated(), id: \.0) { index, readingMoment in
           
           NavigationLink {
               ReadingMomentDetailView(readingMoment: readingMoment)
           } label: {
               if readingMoment == readingMoments.last {
                   ReadingMomentSealView(
                    readingMoment: readingMoment,
                    layout: .large
                   )
               } else {
                   ReadingMomentSealView(readingMoment: readingMoment)
                       .offset(x: sin(Double(index) * .pi / 2) * Self.offSetAmount)
               }
           }
           .scrollTransition { content, phase in
               content
                   .opacity(phase.isIdentity ? 1 : 0)
                   .scaleEffect(phase.isIdentity ? 1 : 0.8)
               
               
           }
           
       }
    }
}

#Preview {
    ReadingMomentsView()
        .sampleDataContainer()
}

#Preview("view when there is no data") {
    ReadingMomentsView()
        .modelContainer(for: [ReadingMoment.self])
        .environment(DataContainer())
}
