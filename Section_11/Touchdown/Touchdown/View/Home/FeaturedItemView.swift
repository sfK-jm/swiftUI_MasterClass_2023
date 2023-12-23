//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by 성준모 on 11/10/23.
//

import SwiftUI

struct FeaturedItemView: View {
    // MARK: - PROPERTY
    let player: Player
    
    // MARK: - BODY
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(player: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .background(colorBackground)
    }
}
