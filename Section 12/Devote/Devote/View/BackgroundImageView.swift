//
//  BackgroundImageView.swift
//  Devote
//
//  Created by 성준모 on 11/18/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            // 이미지를 매끄럽게 만드는 메서드
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
