//
//  CardView.swift
//  Hike
//
//  Created by 성준모 on 10/6/23.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber:Int = 1
    @State private var randomNumber:Int = 1
    
    // MARK: - FUNCTIONS
    
    func randomImage(){
        print("--- BUTTON WAS PRESSED--")
        print("old number is \(imageNumber)")
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("random number Generated \(randomNumber)")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        print("new number is \(imageNumber) ")
        print("---Function is End ---\n")
    }
    
    var body: some View {
        
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button{
                            // ACTION: Show a Sheet
                            print("button was pressed")
                        } label: {
                            CustomButtonView()
                        }
                        
                    } //: HSTACK
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(.colorGrayMedium)
                    
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [Color("ColorIndigoMedium"), Color("ColorSalmonLight")], startPoint: .topLeading, endPoint: .bottomLeading))
                        .frame(width: 256, height: 256)
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                // MARK: - FOOTER
                
                Button(action: {
                    // ACTION: generate a random number
                    randomImage()
                },
                       label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25),
                                radius: 0.25, x:1 ,y: 2)
                }
                )
                .buttonStyle(GradientButton())
                
            } //: VSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
