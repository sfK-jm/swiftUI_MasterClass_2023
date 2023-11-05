//
//  MapView.swift
//  Africa
//
//  Created by 성준모 on 10/27/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTY
    
    // 구형 버전
//    @State private var region: MKCoordinateRegion = {
//        
//        // 지도의 좌표
//        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
//        
//        // 지도의 확대축소 수준
//        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
//        
//        // 실제 지도
//        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
//        
//        return mapRegion
//
//    }()
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599),
        span: MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0)
    ))
    
    let locations: [NationalParkLoaction] = Bundle.main.decode("locations.json")
    
    
    // MARK: - BODY
    var body: some View {
        // MARK: - No1 BASIC MAP
        // Map(position: $cameraPosition)
        
        Map(position: $cameraPosition){
            
        }
        
    }
}

#Preview {
    MapView()
}
