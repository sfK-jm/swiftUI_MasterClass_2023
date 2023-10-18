//
//  PageModel.swift
//  Pinch
//
//  Created by 성준모 on 10/18/23.
//

import Foundation

struct Page: Identifiable{
    let id: Int
    let imageName: String
}

extension Page{
    var thumbnailName: String{
        return "thumb-" + imageName
    }
}
