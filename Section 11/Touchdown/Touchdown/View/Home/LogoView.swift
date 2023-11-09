//
//  LogoView.swift
//  Touchdown
//
//  Created by 성준모 on 11/9/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing:4) {
            Text("touch".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
            
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("down".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .foregroundColor(.black)
                
        } //: HSTACK
    }
}

struct LogoView_Previews:PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
