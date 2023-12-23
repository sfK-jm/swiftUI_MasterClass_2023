//
//  VideoModel.swift
//  Africa
//
//  Created by 성준모 on 11/3/23.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String{
        "video-\(id)"
    }
}
