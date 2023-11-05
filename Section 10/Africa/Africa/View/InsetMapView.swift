//
//  InsetMapView.swift
//  Africa
//
//  Created by 성준모 on 11/3/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTY
    
    // ios 이전 버전
    
//    @State private var cameraPosition = MKCoordinateRegion(
//
//    center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), // initial location
//
//    span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0) // initial zoom
//
//    ))
    
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(

    center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), // initial location

    span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0) // initial zoom

    ))
    
    var body: some View {
        // ios17 이전
        //Map(coordinateRegion: $cameraPosition)
        
        Map(position: $cameraPosition)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } //: NAVIGATION
                    .padding(12)
                ,alignment: .topTrailing
            ) //: OVERLAY
        
        
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider{
    static var previews: some View{
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
