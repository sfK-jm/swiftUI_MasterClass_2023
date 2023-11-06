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
    @State private var region: MKCoordinateRegion = {
        
        // 지도의 좌표
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        // 지도의 확대축소 수준
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        // 실제 지도
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion

    }()
    
    // iOS 17버전 형식
//    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
//        center: CLLocationCoordinate2D(
//            latitude: 6.600286,
//            longitude: 16.4377599),
//        span: MKCoordinateSpan(
//            latitudeDelta: 70.0,
//            longitudeDelta: 70.0)
//    ))
    
    let locations: [NationalParkLoaction] = Bundle.main.decode("locations.json")
    
    
    // MARK: - BODY
    var body: some View {
        // MARK: - No1 BASIC MAP
        // Map(position: $cameraPosition)
        
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            
                // C) CUSTOM BASIC ANNOTAION
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }
            
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        } //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment:. leading, spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    }
                }
            } //: HSTAACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            ,alignment: .top
            
        ) //: OVERLAY
    }
}

#Preview {
    MapView()
}
