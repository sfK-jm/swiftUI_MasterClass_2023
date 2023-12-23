//
//  BlankView.swift
//  Devote
//
//  Created by 성준모 on 11/19/23.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTY
    var backgroundColor: Color
    var backgorundOpacity: Double
    
    // MARK: - BODY
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgorundOpacity)
        .blendMode(.overlay)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    BlankView(backgroundColor: Color.black, backgorundOpacity: 0.3)
        .background(BackgroundImageView())
        .background(backgroundGradient.ignoresSafeArea(.all))
}
