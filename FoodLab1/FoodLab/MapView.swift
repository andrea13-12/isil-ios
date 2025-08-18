//
//  MapView.swift
//  FoodLab
//
//  Created by Andrea Torres on 30/06/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    //let zoom: Float
    
    
    let title: String
    
    var body: some View {
        Map{
            Marker(title, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }
    }
}
