//
//  OnboardingScreen.swift
//  Read+Practice
//
//  Created by Kari Douglas on 2/20/26.
//

import SwiftUI

struct OnboardingScreen: View {
    let item: OnboardingItem
    
    var body: some View {
        ZStack {
            Color(.accent)
                .ignoresSafeArea()
            ScrollView {
                
                VStack {
                    Text(LocalizedStringKey(item.title))
                        .bold()
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.white)
                }
                .padding(.top, 150)
                
                
                VStack {
                    Image(systemName: item.systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .padding()
                        .foregroundStyle(.white)
                    
                    Text(LocalizedStringKey(item.subtitle))
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding()
                        .padding()
                        .foregroundStyle(.white)
                    
                    
                }
                
            }
        }
    }
}

#Preview {
    OnboardingScreen(
        item: OnboardingItem(systemImageName: "book.pages", title: "Welcome to Readdy", subtitle: "Start by reading one page of a book today")
    )
}
