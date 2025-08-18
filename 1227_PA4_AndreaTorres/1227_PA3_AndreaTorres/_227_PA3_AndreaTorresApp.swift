//
//  _227_PA3_AndreaTorresApp.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 10/06/25.
//

import SwiftUI

@main
struct _227_PA3_AndreaTorresApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject private var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
                .environmentObject(cartViewModel) 
        }
    }
}
