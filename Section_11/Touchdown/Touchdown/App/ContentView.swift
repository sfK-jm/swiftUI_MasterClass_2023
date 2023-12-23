//
//  ContentView.swift
//  Touchdown
//
//  Created by 성준모 on 11/8/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PREOPERTY
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if shop.showingProduct == false && shop.selectedProduct == nil {
                    VStack(spacing: 0) {
                        NavigationBarView()
                            .padding(.horizontal, 15)
                            .padding(.bottom)
                            .padding(.top, geometry.safeAreaInsets.top)
                            .shadow(
                                color: .black.opacity(0.05),
                                radius: 5, x: 0, y: 5
                            )
                                            
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack(spacing: 0){
                                
                                FeaturedTabView()
                                    .frame(height: UIScreen.main.bounds.width / 1.475)
                                    .padding(.vertical, 20)
                                
                                // 카테고리
                                CategoryGridView()
                                
                                // 헬맷
                                TitleView(title: "Helmets")
                                
                                // 헬맷 그리드
                                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                    ForEach(products) { product in
                                        ProductItemView(product: product)
                                            .onTapGesture {
                                                feedback.impactOccurred()
                                                withAnimation(.easeOut){
                                                    shop.selectedProduct = product
                                                    shop.showingProduct = true
                                                }
                                            }
                                    } //: LOOP
                                }) //: GRID
                                .padding(15)
                                
                                // 브랜드
                                TitleView(title: "Brands")
                                // 브랜드 그리드
                                BrandGridView()
                                
                                FooterView()
                                    .padding(.horizontal)
                            } //: VSTACK
                        }) //: SCROLLVIEW
                    } //: VSTACK
                    .background(colorBackground.ignoresSafeArea(.all, edges: .all))
                } else {
                    // 제품 상세 뷰
                    ProductDetailView()
                        .padding(.top, geometry.safeAreaInsets.top)
                } //: CONDITION
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
        } //: GEOMETRY
    }
}

#Preview {
    ContentView()
        .environmentObject(Shop())
}
