//
//  LocationModel.swift
//  Africa
//
//  Created by 성준모 on 11/5/23.
//

import Foundation
import MapKit

struct NationalParkLoaction: Codable, Identifiable{
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude )
    }
}
