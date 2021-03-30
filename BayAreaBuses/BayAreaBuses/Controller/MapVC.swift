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
    lazy var latitide = locationManager.location?.coordinate.latitude ?? 122.0090
    lazy var longitude = locationManager.location?.coordinate.longitude ?? 37.3330
    var routesLegs: [RoutesLegs] = []
    
    let searchBar = BABTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLocation()
        setUpMap()
        configureSearchBar()
        
        
    }
    

    
    private func setUpMap(){

        
        let camera = GMSCameraPosition.camera(withLatitude: latitide, longitude: longitude, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let routesVC = RoutesVC()
    
        routesVC.routesLegs = self.routesLegs

        routesVC.modalPresentationStyle = .popover
        
        self.present(routesVC, animated: true, completion: nil)
        return true
    }
}

extension MapVC: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        view.endEditing(true)
    }
}
