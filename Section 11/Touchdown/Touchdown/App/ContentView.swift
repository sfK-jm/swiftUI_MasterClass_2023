//
//  ContentView.swift
//  Touchdown
//
//  Created by 성준모 on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PREOPERTY

    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, geometry.safeAreaInsets.top)
                        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                    
                    FooterView()
                        .padding(.horizontal)
                } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    ContentView()
}
