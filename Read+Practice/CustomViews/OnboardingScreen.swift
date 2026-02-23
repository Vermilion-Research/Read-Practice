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
                
                VStack() {
                    Text(item.title)
                        .bold()
                        .font(.largeTitle)
                        .padding(.bottom)
                        .foregroundStyle(.white)
                }
                .padding(.top, 150)
                
                
                VStack {
                    Image(systemName: item.systemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .padding(.top, 32)
                        .padding(.bottom, 32)
                        .foregroundStyle(.white)
                    
                    Text(item.subtitle)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .foregroundStyle(.white)
                    
                    Button {
                        // put the toggle next view here
                    } label: {
                        Text("Next")
                            .textCase(.uppercase)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.coral)
                            
                    }
                    .frame(maxWidth: .infinity, idealHeight: 65)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .padding()
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
