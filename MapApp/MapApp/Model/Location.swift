//
//  Location.swift
//  MapApp
//
//  Created by Vipal on 22/09/22.
//

import Foundation
import MapKit
struct Location : Identifiable , Equatable{
 
    
    var id :String{
         name + cityName
    }
    var name :String
    var cityName: String
    var coordinates : CLLocationCoordinate2D
    var description: String
    var imageNames: [String]
    var link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
  
}

