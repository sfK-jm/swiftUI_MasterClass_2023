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
                                        
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 0){
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                                .padding(.vertical, 20)
                            
                            CategoryGridView()
                            
                            TitleView(title: "Helmets")
                            LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                ForEach(products) { product in
                                    ProductItemView(product: product)
                                } //: LOOP
                            }) //: GRID
                            .padding(15)
                            
                            
                            FooterView()
                                .padding(.horizontal)
                        } //: VSTACK
                    }) //: SCROLLVIEW
                    
                   
                } //: VSTACK
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
        } //: GEOMETRY
    }
}

#Preview {
    ContentView()
}
