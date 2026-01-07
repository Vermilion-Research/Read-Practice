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
            .navigationTitle("Reading Moments")
        }
        
    }
    
   private var pathItems: some View {
       
       ForEach(readingMoments) { readingMoment in
           
           NavigationLink {
               ReadingMomentDetailView(readingMoment: readingMoment)
           } label: {
               Text(readingMoment.title)
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
}
