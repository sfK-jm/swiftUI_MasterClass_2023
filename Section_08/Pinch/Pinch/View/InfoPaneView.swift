//
//  InfoPaneView.swift
//  Pinch
//
//  Created by 성준모 on 10/16/23.
//

import SwiftUI

struct InfoPaneView: View {
    
    @State private var isInfoPanelVisible:Bool = false
    
    var scalse: CGFloat
    var offset: CGSize
    
    var body: some View {
        HStack{
            // MARK: - HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            // MARK: - INFO PANEL
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scalse)")
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            } //: HSTACK
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            Spacer()
        } //: HSTACK
    }
}


struct InfoPaneView_prevview: PreviewProvider {
    static var previews: some View {
        InfoPaneView(scalse: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
