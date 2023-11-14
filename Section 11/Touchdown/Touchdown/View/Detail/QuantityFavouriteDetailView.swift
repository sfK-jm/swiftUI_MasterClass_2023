//
//  QuantityFavouriteDetailView.swift
//  Touchdown
//
//  Created by 성준모 on 11/13/23.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    // MARK: - PROPERTY
    @State private var counter: Int = 0
    
    var body: some View {
        HStack (alignment: .center, spacing: 6){
            Button(action: {
                if counter > 0 {
                    feedback.impactOccurred()
                    counter -= 1
                }}, label: {
                Image(systemName: "minus.circle")
            }) //: BUTTON
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button(action: {
                if counter < 100 {
                    feedback.impactOccurred()
                    counter += 1
                }}, label: {
                Image(systemName: "plus.circle")
            }) //: BUTTON
            
            Spacer()
            
            Button(action: {
                feedback.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
            }) //: BUTTON
            .foregroundColor(.pink)
            
            
        } //: HSTACK
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

struct QuantityFavouriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavouriteDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
