//
//  ReadingMomentDetailView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/7/26.
//

import SwiftUI
import SwiftData

struct ReadingMomentDetailView: View {
    
    var readingMoment: ReadingMoment
    @State private var showConfirmation = false
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) var dataContainer
    
    var body: some View {
        ScrollView {
            contentStack
        }
        .navigationTitle(readingMoment.title)
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    showConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("Delete reading moment?", isPresented: $showConfirmation) {
                    Button("Delete reading moment", role: .destructive) {
                        dataContainer.context.delete(readingMoment)
                        try? dataContainer.context.save()
                        dismiss()
                    }
                } message: {
                    Text("This reading moment will be deleted. Earned badges will stay.")
                }
            }
        }
        
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            Text(readingMoment.timeStamp, style: .date)
                .font(.subheadline)
            if !readingMoment.note.isEmpty {
                Text(readingMoment.note)
                    .textSelection(.enabled)
            }
            if let image = readingMoment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    NavigationStack {
        ReadingMomentDetailView(readingMoment: .imageSample)
            .sampleDataContainer()
    }
}
