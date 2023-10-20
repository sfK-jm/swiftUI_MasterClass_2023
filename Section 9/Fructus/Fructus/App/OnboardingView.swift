//
//  OnboardingView.swift
//  Fructus
//
//  Created by 성준모 on 10/19/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(fruits[0...5]){ item in
                //FruitCardView()
                FruitCardView(fruit: item)
            }
            
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: - PREVIEW
#Preview {
    OnboardingView(fruits: fruitsData)
}
