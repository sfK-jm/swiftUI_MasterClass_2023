//
//  BrandGridView.swift
//  Touchdown
//
//  Created by 성준모 on 11/13/23.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands) { brand in
                        BrandItemView(brand: brand)
                } //: LOOP
            }) //: GRID
            .frame(height: 200)
            .padding(15)
        } //: SCROLL
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
