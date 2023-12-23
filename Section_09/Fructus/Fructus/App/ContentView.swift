//
//  ContentView.swift
//  Fructus
//
//  Created by 성준모 on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isShowingSettings: Bool = false
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(destination: FruitDetailView(fruit: item)){
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .toolbar{
                Button(action: {
                    isShowingSettings = true
                }, label: {Image(
                    systemName: "slider.horizontal.3"
                )}) //: TOOLBAR BUTTON
                
                .sheet(isPresented: $isShowingSettings, content: {
                    SettingsView()
                })
            } //: TOOLBAR
            
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView(fruits: fruitsData)
}
