//
//  Shop.swift
//  Touchdown
//
//  Created by 성준모 on 11/14/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
