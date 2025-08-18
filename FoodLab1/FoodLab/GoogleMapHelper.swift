//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by Andrea Torres on 30/06/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    private init() {
        GMSServices
            .provideAPIKey("AIzaSyAnrXPtKcp8qO7Dx6E2FQ2pucwHUugHlnM")
    }
}
