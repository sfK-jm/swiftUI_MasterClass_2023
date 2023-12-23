//
//  HeadingView.swift
//  Africa
//
//  Created by 성준모 on 11/2/23.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTY
    
    var headingImage: String
    var headingText: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}


struct HeadingView_Previes: PreviewProvider{
    static var previews: some View{
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
