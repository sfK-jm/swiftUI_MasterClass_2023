//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by 성준모 on 11/13/23.
//

import SwiftUI

struct ProductDetailView: View {
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
                
                // DETAIL BOTTOM PART
                
                // RATING + SIZES
                
                // DESCRIPTION
                
                // QUANTITY + FAVOURITE
                
                // ADD TO CART
                Spacer()
            } //: VSTACK
            .ignoresSafeArea(.all, edges: .all)
            .background(Color(
                red: sampleProduct.red,
                green: sampleProduct.green,
                blue: sampleProduct.blue)
            )
        .ignoresSafeArea(.all, edges: .all)
        } //: GEOMETRY
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
