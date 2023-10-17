//
//  ContentView.swift
//  Pinch
//
//  Created by 성준모 on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - FUNCTION
    
    func resetImageState(){
        return withAnimation(.spring){
            imageScale = 1
            imageOffset = .zero
            
        }
    }
    
    // MARK: - CONTENT
    var body: some View {
        NavigationStack(){
            ZStack(){
                Color.clear
                
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                // 화면배율
                    .scaleEffect(imageScale)
                
                // MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1{
                            withAnimation(.spring){
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                
                // MARK: - DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded{ _ in
                                if imageScale <= 1{
                                    resetImageState()
                                }
                            }
                    )
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                    
                }
            })
            
            // MARK: - INFO PANEL
            .overlay(
                InfoPaneView(scalse: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            
            
        } //: NAVIGATIONSTACK
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
