//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by 성준모 on 10/6/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. DEPTH
            Color("ColorGreenDark")
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. LIGHT
            
            // MARK: - 1. SURFACE
            
            LinearGradient(
                colors: [
                    Color("ColorGreenLight"),
                    Color("ColorGreenMedium")],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
