//
//  ContentView.swift
//  TAG
//
//  Created by Davey Adams on 5/21/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let locationManager = CLLocationManager()
    
    var body: some View {
        Map() {
//            Marker("Apple HQ", systemImage: "laptopcomputer", coordinate: .appleHQ)
//            Marker("Panama Park", systemImage: "tree.fill", coordinate: .panamaPark).tint(.green)
            
            Annotation("Apple HQ", coordinate: .appleHQ, anchor: .center) {
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding(7)
                    .background(.pink.gradient, in: .circle)
            }
            Annotation("Panama Park", coordinate: .panamaPark, anchor: .bottom) {
                Image(systemName: "tree.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.white)
                    .frame(width: 20, height: 20)
                    .padding(7)
                    .background(.green.gradient, in: .circle)
            }
            
            UserAnnotation()
        }
        .onAppear() {
            locationManager.requestWhenInUseAuthorization()
        }
        .mapControls() {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        .mapStyle(.hybrid)
    }
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let appleHQ = CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.009)
    static let panamaPark = CLLocationCoordinate2D(latitude: 37.34773, longitude: -122.018715)
}
