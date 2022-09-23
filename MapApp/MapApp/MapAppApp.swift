//
//  MapAppApp.swift
//  MapApp
//
//  Created by Vipal on 22/09/22.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
           // ContentView()
            LocationView().environmentObject(vm)
        }
    }
}
