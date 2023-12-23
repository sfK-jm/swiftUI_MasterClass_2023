//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by 성준모 on 11/8/23.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
