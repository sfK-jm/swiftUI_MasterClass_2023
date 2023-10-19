//
//  OnboardingView.swift
//  Fructus
//
//  Created by 성준모 on 10/19/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(0 ..< 5){ item in
                FruitCardView()

            }
            
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
#Preview {
    OnboardingView()
}
