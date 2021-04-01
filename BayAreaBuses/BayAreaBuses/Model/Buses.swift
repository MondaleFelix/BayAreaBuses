//
//  Buses.swift
//  BayAreaBuses
//
//  Created by Mondale on 4/1/21.
//

import Foundation

struct Siri: Codable {
    var Siri: ServiceDelivery
}

struct ServiceDelivery: Codable {
    var ServiceDelivery: VehicleMonitoringDelivery
}

struct VehicleMonitoringDelivery: Codable {
    var VehicleMonitoringDelivery: VehicleActivity
}

struct VehicleActivity: Codable {
    var VehicleActivity: [MonitoredVehicleJourney]
}

struct MonitoredVehicleJourney: Codable {
    var MonitoredVehicleJourney: BusDetails
}

struct BusDetails: Codable {
    var LineRef: String
    var VehicleLocation: Location
}

struct Location: Codable {
    var Longitude: String
    var Latitude: String
}
