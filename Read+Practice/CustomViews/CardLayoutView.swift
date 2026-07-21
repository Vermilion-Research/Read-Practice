//
//  CardLayoutView.swift
//  Read+Practice
//
//  Created by Kari Douglas on 7/21/26.
//

import SwiftUI

struct CardLayoutView: View {
    var body: some View {
        VStack {
          
        }
        .padding()
        .frame(width: 320)
        .frame(minWidth: 410)
        .fixedSize()
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .background(.accent.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 16.0))
    }
}

#Preview {
    CardLayoutView()
}
