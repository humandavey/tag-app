//
//  MapView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let locationManager = CLLocationManager()
    
    var body: some View {
        Map() {
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
    MapView()
}
