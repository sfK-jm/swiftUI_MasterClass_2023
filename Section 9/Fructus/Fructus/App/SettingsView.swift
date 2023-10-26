//
//  SettingsView.swift
//  Fructus
//
//  Created by 성준모 on 10/25/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTY
    @Environment(\.dismiss) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    
                    // MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "fructus", labelImage: "info.circle")
                    ){
                        Divider().padding(.vertical, 4)
                        HStack(alignment:.center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                        
                    }
                    
                    
                    // MARK: - SECTION 2
                    
                    
                    GroupBox(
                        label: SettingsLabelView(
                            labelText: "Customization",
                            labelImage: "paintbrush"),
                        content: {
                        Divider()
                            .padding(.vertical, 4)
                            
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                                .padding(.vertical, 8)
                                .frame(minHeight: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                            Toggle(isOn: $isOnboarding) {
                                if isOnboarding {
                                    Text("Restarted".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.green)
                                } else {
                                    Text("Restart".uppercased())
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color.secondary)
                                }
                            }
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemGroupedBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            )
                            
                    })
                    
                    // MARK: - SECTION 3
                    
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        
                        SettingsRowView(name: "Developer", content: "John / Jane")
                        
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Learner", content: "JM")
                        
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com"
                        )
                        
                        SettingsRowView(name: "Compatibility", content: "iOS 17")
                        
                        SettingsRowView(name: "Version", content: "1.1.0")
                        
                        
                        
                        
                    }) //: GROUPBOX
                    
                } //: VSTACK
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar{
                    Button(action: {
                        presentationMode()
                        print("press dissmiss button")
                    }, label: {
                        Image(systemName: "xmark")
                    })
                } //: TOOLBAR
                
                
                .padding()
            } //: SCROLL
        } //: NAVIGATION
    }
}

#Preview {
    SettingsView()
}
