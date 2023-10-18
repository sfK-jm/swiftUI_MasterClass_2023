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
    @State private var isDrawerOpen:Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 0
    
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
                Image(pages[pageIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                // 화면배율조정
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
                // MARK: - 3. Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    if imageScale >= 1 && imageScale <= 5{
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                    
                                }
                            }
                            .onEnded(){ _ in
                                if imageScale > 5{
                                    imageScale = 5
                                } else if imageScale <= 1{
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
            
            // MARK: - CONTROLS
            .overlay(
                Group{
                    HStack{
                        // SCALE DOWM
                        Button {
                            withAnimation(.spring()){
                                if imageScale > 1{
                                    imageScale -= 1
                                    
                                    // 예방 조치
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                            
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // RESET
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // SCALE UP
                        Button {
                            if imageScale < 5{
                                imageScale += 1
                                
                                if imageScale >= 5{
                                    imageScale = 5
                                }
                            }
                            
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                        
                    } //: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    
                } //: GROUP
                
                    .padding(.bottom), alignment: .bottom
            ) //: OVERLAY CONTROLS
            
            
            // MARK: - DRAWER
            .overlay(
                HStack(spacing: 12){
                    // MARK: - DWARER HANDLE
                    Image(systemName: isDrawerOpen ?
                          "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut){
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    // MARK: - THUMBNAILS
                    ForEach(pages) { item in
                        Image(item.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture(perform: {
                                isAnimating = true
                                pageIndex = item.id
                            })
                    }
                    
                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .offset(x: isDrawerOpen ? 20 : 215)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    , alignment: .topTrailing
            )
            
        } //: NAVIGATIONSTACK
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
