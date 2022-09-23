//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Vipal on 22/09/22.
//


import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
//            showLocationsList = !showLocationsList
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextbuttonPress() {
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        
        // Check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index IS valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
}

//class LocationViewModel :ObservableObject {
//    //All Loaded Loaction
//    @Published var locations : [Location]
//
//    // Current Location
//    @Published var maplocation : Location {
//        didSet{
//            updateMapRegion(location: maplocation )
//        }
//    }
//    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
//    @State var mapRegion2 : MKCoordinateRegion = MKCoordinateRegion()
//
//
//    //showLocationlist
//    @Published var showLocationlist : Bool = false
//
//
//    @Published var showLocationDetailes : Bool = false
//    @Published var sheetLocation : Location? = nil
//
//
//
//    @Published  var span : MKCoordinateSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//
//    init() {
//        let locations =  LocationsDataService.locations
//        self.locations = locations
//        self.maplocation = locations.first!
//        updateMapRegion(location:  locations.first!)
//    }
//    private func updateMapRegion(location: Location){
//        DispatchQueue.main.async {
//            // environment changing code comes here
//            withAnimation {
//                self.mapRegion =  MKCoordinateRegion(
//                    center: CLLocationCoordinate2D(latitude: location.coordinates.latitude, longitude: location.coordinates.longitude),
//                    span:self.span)
//            }
//        }
//
//
//    }
//    func showNextLocation (location : Location) {
//        DispatchQueue.main.async {
//            withAnimation(.easeInOut) {
//                self.maplocation = location
//                self.showLocationlist = false
//            }
//        }
//
//    }
//     func toggleListShow () {
//         DispatchQueue.main.async {
//             withAnimation (.easeInOut){
//                 self.showLocationlist.toggle()
//             }
//         }
//
//
//    }
//    func nextbuttonPress (){
//        //Get the current index
//        let  currrentIndex = locations.firstIndex { location in
//            return location == maplocation
//        }
//        guard let currrentIndex =  currrentIndex else {
//            return
//        }
//        let nextIndex = currrentIndex + 1
//        guard locations.indices.contains(nextIndex) else {
//            //Next Index in not valide restart from 0
//             let firstLocation = locations.first!
//            showNextLocation(location: firstLocation)
//            return
//        }
//
//        let nexLocation = locations[nextIndex]
//        maplocation = nexLocation
//    }
//}
