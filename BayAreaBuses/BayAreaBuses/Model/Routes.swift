//
//  Routes.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/29/21.
//

import Foundation

struct EndLocation : Codable {
    var lat: Double
    var lng: Double
}

struct ArrivalTime: Codable {
    var text: String
}

struct DepartureTime: Codable {
    var text: String
}

struct Distance: Codable {
    var text: String
}

struct Duration: Codable {
    var text: String
}

struct Legs: Codable {
    var arrival_time: ArrivalTime
    var departure_time: DepartureTime
    var distance: Distance
    var duration: Duration
    var end_location : EndLocation
    
}

struct Polyline: Codable {
    var points: String
}

struct RoutesLegs: Codable {
    var legs: [Legs]
    var overview_polyline: Polyline
}

struct RoutesList: Codable {
    var routes: [RoutesLegs]
}
