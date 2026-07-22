//
//  SettingsView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 7/20/26.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    //TODO: ADD REAL URLS FOR PRIVACY POLICY AND TERMS OF SERVICE
    @State private var showSettingsView: Bool = true
    
    @Environment(\.dismiss) private var dismiss
    
    let url = URL(string: "https://www.example.com")!
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Link(destination: url) {
                    Text("Privacy Policy")
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                .padding()
                Divider()
                Link(destination: url) {
                    Text("Terms of Service")
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "rectangle.portrait.and.arrow.forward")
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button ("Exit", systemImage: "xmark"){
                        dismiss()
                    }
                }
            }
            .padding()
            .frame(width: 320)
            .frame(minWidth: 410)
            .fixedSize()
            .multilineTextAlignment(.center)
            .foregroundStyle(.white)
            .background(.accent.opacity(0.9))
            .clipShape(RoundedRectangle(cornerRadius: 16.0))
            .navigationTitle("Settings")
            .padding()
            .padding()
            Spacer()
        }
        
    }

}


#Preview {
    SettingsView()
}
