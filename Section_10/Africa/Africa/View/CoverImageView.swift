//
//  CoverImageView.swift
//  Africa
//
//  Created by 성준모 on 10/31/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTY
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        
    }
}

// MARK: - PREVIEWS
struct CoverImageView_Previews: PreviewProvider{
    static var previews: some View{
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
