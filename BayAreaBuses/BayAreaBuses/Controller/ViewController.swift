//
//  ViewController.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/24/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocation()
        setUpMap()
    }
    
    private func setUpMap(){
        let latitide = locationManager.location?.coordinate.latitude ?? 122.0090
        let longitude = locationManager.location?.coordinate.longitude ?? 37.3330
        
        let camera = GMSCameraPosition.camera(withLatitude: latitide, longitude: longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitide, longitude: longitude)
        marker.map = mapView
    }
    
    private func setUpLocation(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
}
