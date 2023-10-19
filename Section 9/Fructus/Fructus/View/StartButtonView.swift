//
//  StartButtonView.swift
//  Fructus
//
//  Created by 성준모 on 10/18/23.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            print("Exit the Onboarding")
        }, label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            } //: HSTACK
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
        }) //: BUTTON
        .accentColor(Color.white)
    }
}


struct StartButtonView_Preview: PreviewProvider{
    static var previews: some View{
        StartButtonView()
            .previewLayout(.sizeThatFits)
    }
}
