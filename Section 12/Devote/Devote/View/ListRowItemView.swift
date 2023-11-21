//
//  ListRowItemView.swift
//  Devote
//
//  Created by 성준모 on 11/21/23.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - PROPERTY
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item : Item
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.task)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        
        // item.objectWillChang시에 다음 perform을 수행
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? self.viewContext.save()
            }
        })
    }
}

