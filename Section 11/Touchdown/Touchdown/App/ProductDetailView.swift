//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by 성준모 on 11/13/23.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var shop: Shop
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 5){
                // NAVIBAR
                NavigationBarDetailView()
                    .padding(.horizontal)
                    .padding(.top, geometry.safeAreaInsets.top)
                
                // HEADER
                HeaderDetailView()
                    .padding(.horizontal)
                
                // DETAIL TOP PART
                TopPartDetailView()
                    .padding(.horizontal)
                    .zIndex(1)
                
                // DETAIL BOTTOM PART
                VStack(alignment:.center, spacing: 0){
                    
                    // RATING + SIZES
                    RatingsSizesDetailView()
                        .padding(.top, -20)
                        .padding(.bottom, 10)
                    
                    // DESCRIPTION
                    ScrollView(.vertical, showsIndicators: false){
                        Text(shop.selectedProduct?.description ?? sampleProduct.description)
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    } //: SCROLL
                    
                    // QUANTITY + FAVOURITE
                    QuantityFavouriteDetailView()
                        .padding(.vertical, 10)
                    
                    // ADD TO CART
                    AddToCartDetailView()
                        .padding(.bottom, 10)
                    
                } //: VSTAACK
                .padding(.horizontal)
                .background(
                    Color.white
                        .clipShape(CustomShape())
                        .padding(.top, -105)
                )
            } //: VSTACK
            .zIndex(0)
            .ignoresSafeArea(.all, edges: .all)
            .background(Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
            )
            .ignoresSafeArea(.all, edges: .all)
        } //: GEOMETRY
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
