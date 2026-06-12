//
//  MomentEntryView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 1/6/26.
//

import SwiftUI
import PhotosUI
import SwiftData
import UIKit

struct MomentEntryView: View {
    @State private var title = ""
    @State private var note = ""
    @State private var imageData: Data?
    @State private var newImage: PhotosPickerItem?
    @State private var isShowingCancelConfirmation = false
    @State private var showCamera: Bool = false
    @State private var cameraError: CameraPermission.CameraError?
    @State private var cameraImage: UIImage?
    
    @Environment(DataContainer.self) private var dataContainer
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                contentStack
                orDividerWord
                cameraButton
            }
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Reading Moment")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel", systemImage: "xmark") {
                        if title.isEmpty, note.isEmpty, imageData == nil {
                            dismiss()
                        } else {
                            isShowingCancelConfirmation = true
                        }
                    }
                    .confirmationDialog(
                        "Discard reading moment? ",
                        isPresented: $isShowingCancelConfirmation
                    ) {
                        Button("Discard Reading moment", role: .destructive) {
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "checkmark") {
                        
                        let newReadingMoment = ReadingMoment(
                            title: title,
                            note: note,
                            imageData: imageData,
                            timeStamp: .now
                        )
                        dataContainer.context.insert(newReadingMoment)
                        dismiss()
                        do {
                            try dataContainer.readingBadgeManager
                                .unlockBadges(
                                    newReadingMoment: newReadingMoment
                                )
                            try dataContainer.context.save()
                            
                        } catch {
                            fatalError()
                        }
                    }
                    .disabled(note.isEmpty)
                }
            }
        }
        
    }
    
    private var photoPicker: some View {
        PhotosPicker(selection: $newImage) {
            Group {
                if let imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.largeTitle)
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color(white: 0.4, opacity: 0.32))
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: newImage) {
            guard let newImage else { return }
            Task {
                imageData = try await newImage.loadTransferable(type: Data.self)
            }
        }
    }
    
    private var cameraButton: some View {
        Button() {
            if let error = CameraPermission.checkPermission() {
                cameraError = error
            } else {
                showCamera.toggle()
            }
        } label: {
            Image(systemName: "camera.aperture")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 65)
        }
        .alert(
            isPresented: .constant(cameraError != nil),
            error: cameraError
        ) { _ in
            Button("OK") {
                cameraError = nil
            }
        } message: { error in
            Text(error.recoverSuggestion ?? "Try again later")
        }
        .sheet(isPresented: $showCamera) {
            UIKitCamera(selectedImage: $cameraImage )
                .ignoresSafeArea()
        }
        .onChange(of: cameraImage) {
            guard let newCameraImage = cameraImage else { return }
            Task {
                if let jpegData = newCameraImage.jpegData(compressionQuality: 1.0) {
                    imageData = jpegData
                }
            }
        }
        .buttonStyle(.glassProminent)
        .controlSize(.regular)
       
    }
    
    var contentStack: some View {
        VStack(alignment: .leading) {
            TextField(text: $title){
                Text("Title")
            }
            .font(.title.bold())
            .padding(.top, 48)
            Divider()
            
            TextField("Log your two sentence summary (Required)", text: $note, axis: .vertical)
                .multilineTextAlignment(.leading)
                .lineLimit(5...Int.max)
            
            photoPicker
        }
        .padding()
    }
    
    private var orDividerWord: some View {
        Text("OR")
            .font(.callout)
            .fontWeight(.bold)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    MomentEntryView()
        .sampleDataContainer()
}
