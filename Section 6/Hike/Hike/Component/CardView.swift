//
//  CardView.swift
//  Hike
//
//  Created by 성준모 on 10/6/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [Color("ColorIndigoMedium"), Color("ColorSalmonLight")], startPoint: .topLeading, endPoint: .bottomLeading))
                .frame(width: 256, height: 256)
            
            Image("image-1")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    CardView()
}
