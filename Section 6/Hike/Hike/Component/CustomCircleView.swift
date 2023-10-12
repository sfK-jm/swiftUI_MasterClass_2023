//
//  CustomCircleView.swift
//  Hike
//
//  Created by 성준모 on 10/12/23.
//

import SwiftUI

struct CustomCircleView: View {
    
  @State private var isAnimateGradient: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              .customIndigoMedium,
              .customSalmonLight
            ],
            startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
            endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
          )
        )
        .onAppear {
          withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
            isAnimateGradient.toggle()
          }
        }
      MotionAnimationView()
    } //: ZSTACK
    .frame(width: 256, height: 256)
  }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        CustomCircleView()
    }
}
