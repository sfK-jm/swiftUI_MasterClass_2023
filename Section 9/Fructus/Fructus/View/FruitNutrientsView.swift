//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by 성준모 on 10/24/23.
//

import SwiftUI

struct FruitNutrientsView: View {
    // MARK: - PROPERTY
    
    var fruit: Fruit
    var nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    // MARK: - BODY
    var body: some View {
        GroupBox{
            DisclosureGroup("Nutritional value per 100g"){
                ForEach(0 ..< nutrients.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundStyle(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        } //: BOX
    }
}

struct FruitNutrientsView_Previews: PreviewProvider{
    static var previews: some View{
        FruitNutrientsView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
