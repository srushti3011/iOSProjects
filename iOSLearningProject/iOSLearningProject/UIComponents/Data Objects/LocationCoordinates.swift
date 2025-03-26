//
//  LocationCoordinates.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 07/03/25.
//

import Foundation
import MapKit

struct LocationDetailItem {
    let name: String
    let coordinates: CLLocation
}

let locationDetails: [LocationDetailItem] = [
    LocationDetailItem(name: "Ahmedabad", coordinates: CLLocation(latitude: 23.0215374, longitude: 72.5800568)),
    LocationDetailItem(name: "Surat", coordinates: CLLocation(latitude: 21.2094892, longitude: 72.8317058)),
    LocationDetailItem(name: "Coimbatore", coordinates: CLLocation(latitude: 11.0018115, longitude: 76.9628425))
]
