//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by 성준모 on 10/25/23.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTY
    
    var labelText: String
    var labelImage : String
    // MARK: - BODy
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}


struct SettingsLabelView_PreViews: PreviewProvider{
    static  var previews: some View{
        SettingsLabelView(labelText: "fructus", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
