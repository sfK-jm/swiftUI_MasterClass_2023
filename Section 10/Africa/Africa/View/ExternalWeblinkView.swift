//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by 성준모 on 11/3/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTY
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipidia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: 
                            (URL(string: animal.link) ??
                             URL(string: "https://www.wikipedia.org"))!,
                         label: { Text(animal.name) })
                }
                .foregroundColor(.accentColor)
                
            } //: HSTACK
            
        } //: GROUPBOX
    }
}

// MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
