//
//  CircleGroupView.swift
//  Restart
//
//  Created by 성준모 on 2023/05/01.
//

import SwiftUI


struct CircleGroupView: View {
    // MARK: - PROPERTY
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimaitng: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimaitng ? 0 : 10)
        .opacity(isAnimaitng ? 1 : 0)
        .scaleEffect(isAnimaitng ? 1 : 0.5)
        .animation(.easeOut(duration:1), value: isAnimaitng)
        .onAppear(perform:{
            isAnimaitng = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
