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
                LazyVStack(spacing: 8, pinnedViews: .sectionHeaders) {
                    Section {
                        pathItems
                            .frame(maxWidth: .infinity)
                    } header: {
                        streakHeader
                    }
                }
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
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        
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
    
    @ViewBuilder private var streakHeader: some View {
        let streak = StreakCalculator().calculateStreak(for: readingMoments)
        if streak > 0 {
            HStack {
                Text(verbatim: "\(streak)")
                Text(Image(systemName: "flame.fill"))
                    .foregroundStyle(.ember)
                Spacer()
            }
            .font(.subheadline)
            .padding()
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
