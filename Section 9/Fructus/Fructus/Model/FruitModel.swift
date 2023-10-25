//
//  FruitModel.swift
//  Fructus
//
//  Created by 성준모 on 10/20/23.
//

import Foundation
import SwiftUI

// MARK: - FRUITS DATA MODEL

struct Fruit: Identifiable, Hashable{
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
