//
//  ViewController.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/24/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate{
    
    
    var locationManager = CLLocationManager()
    lazy var latitide = locationManager.location?.coordinate.latitude ?? 37.7864
    lazy var longitude = locationManager.location?.coordinate.longitude ?? -122.4065
    lazy var camera = GMSCameraPosition.camera(withLatitude: latitide, longitude: longitude, zoom: 15.0)
    lazy var mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
    let searchBar = BABTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocation()
        setUpMap()
        configureSearchBar()

    }
    

    // Helper method to add New Markers to Map
    private func addMapMarker(lat: Double, long: Double, isBus: Bool = false){
        
        let mapMarker = GMSMarker()
        if isBus {
            mapMarker.icon = UIImage(named: "busIcon")
        }
        
        mapMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapMarker.map = mapView
    }
    
    // Gets Bus Coordinates and plots them on the map
    private func getBuses(busName: String){
        NetworkManager.shared.getBusLocation() { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            // Creates Map Markers of bus location if request succeeds
            case .success(let locations):
                for i in 0..<locations.count{
                    let bus = locations[i].MonitoredVehicleJourney
                    let lat = Double(bus.VehicleLocation.Latitude)!
                    let long = Double(bus.VehicleLocation.Longitude)!
                    
                    if busName == bus.LineRef {
                        DispatchQueue.main.sync {
                            self.addMapMarker(lat: lat, long: long, isBus: true)
                        }
                    }
                }
            // Returns error if request fails
            case .failure(let error):
                print(error)
            }
        }
    }
    


    // Initializes Map View with users current location
    private func setUpMap(){
        mapView.delegate = self
        self.view.addSubview(mapView)
        addMapMarker(lat: latitide, long: longitude)

    }
    
    
    // Updates map with returned polyline
    private func updateMap(polyline:String, end: EndLocation){
        let path = GMSMutablePath(fromEncodedPath: polyline)
        let line = GMSPolyline(path: path)
        line.strokeWidth = 5
        line.strokeColor = .systemTeal
        line.map = mapView
        
        // Starting Location Marker
        addMapMarker(lat: latitide, long: longitude)
        // End Location Marker
        addMapMarker(lat: end.lat, long: end.lng)


        
    }

    // Configures Core Location
    private func setUpLocation(){
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
    }
    
    // Configures Search Bar - programmaticlly
    private func configureSearchBar(){
        view.addSubview(searchBar)
        searchBar.delegate = self

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
}

extension MapVC: UITextFieldDelegate {
    
    // Displays Routes View Controller when user presses enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let routesVC = RoutesVC()
        routesVC.delegate = self
        
        routesVC.latitude = String(latitide)
        routesVC.longitude = String(longitude)
        routesVC.end_location = searchBar.text ?? ""
        routesVC.modalPresentationStyle = .popover

        self.present(routesVC, animated: true, completion: nil)
        return true
    }
}

extension MapVC: GMSMapViewDelegate {
    // Dismisses keyboard when user taps map
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        view.endEditing(true)
    }
    
    
}

extension MapVC:RoutesVCDelegate {
    // Updates map with selected route data
    func sendPolyline(polyline: String, end: EndLocation, busId busID: String) {
        mapView.clear()
        updateMap(polyline: polyline, end: end)
        self.getBuses(busName: busID)


    }

}

