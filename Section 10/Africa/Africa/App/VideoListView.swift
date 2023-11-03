//
//  VideoListView.swift
//  Africa
//
//  Created by 성준모 on 10/27/23.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PrOPERTY
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView{
            List{
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 5)
                } //: LOOP
            } //: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Shuffle Videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } //: NAVIGATION
        
        
    }
}

// MARK: - PREVIEW
#Preview {
    VideoListView()
}
