//
//  CategoryModel.swift
//  Touchdown
//
//  Created by 성준모 on 11/11/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
