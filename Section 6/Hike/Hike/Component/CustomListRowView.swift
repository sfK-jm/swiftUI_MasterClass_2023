//
//  CustomListRowView.swift
//  Hike
//
//  Created by 성준모 on 10/14/23.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK: - PROPERTIES
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestionation: String? = nil
    
    
    var body: some View {
        LabeledContent {
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
                
            } else if(rowLinkLabel != nil && rowLinkDestionation != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestionation!)!)
                    .foregroundStyle(.pink)
                    .fontWeight(.heavy)
            } else {
                EmptyView()
            }
        } label: {
            // Label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    
    List {
        CustomListRowView(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
            rowContent: "Junmo",
            rowTintColor: .pink
        )
        
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestionation: "https://credo.academy"
        )
    }
}
