//
//  FruitRowView.swift
//  Fructus
//
//  Created by 성준모 on 10/22/23.
//

import SwiftUI

struct FruitRowView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    var fruit: Fruit
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
                // APPSTORAGE TEST CODE
                .onTapGesture {
                    print("click image")
                    isOnboarding = true
                } //: TEST CODE
            
            
            VStack(alignment: .leading, spacing: 5){
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        } //: HSTACK
    }
}


struct FruitRowView_Previews: PreviewProvider{
    static var previews: some View{
        FruitRowView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
