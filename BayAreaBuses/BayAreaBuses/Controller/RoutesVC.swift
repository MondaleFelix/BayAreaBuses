//
//  RoutesVC.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/27/21.
//

import UIKit

protocol RoutesVCDelegate: class {
    func sendPolyline(steps: [Directions], end: EndLocation, busId: String )
}

class RoutesVC: UIViewController {

    let tableView = UITableView()
    var routesLegs : [RoutesLegs] = []
    var delegate: RoutesVCDelegate?
    
    var latitude = ""
    var longitude = ""
    var end_location = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRoutes()
        configureTableView()
    }
    
    // Gets possible routes to end location and displays in table view
    private func getRoutes(){
        
        let end_location = self.end_location.replacingOccurrences(of: " ", with: "%20")
        NetworkManager.shared.getRoutes(start: latitude+","+longitude, end: end_location) { [weak self] (result) in

            guard let self = self else { return }
            
            switch result {
            case .success(let routes):
                self.routesLegs = routes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // Configures Route Table View properties
    private func configureTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.register(RoutesCell.self, forCellReuseIdentifier: "RoutesCell")
        
        tableView.delegate = self
        tableView.dataSource = self

        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}

extension RoutesVC: UITableViewDelegate {
    
    // Sends selected route data to MapVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let route = self.routesLegs[indexPath.row].overview_polyline.points
        let steps = self.routesLegs[indexPath.row].legs[0].steps
        var bus = ""
        
        for i in 0..<steps.count{
            if let busName = steps[i].transit_details?.line.short_name {
                bus = busName
            }
        }

        let endLocation = self.routesLegs[indexPath.row].legs[0].end_location
        
        delegate?.sendPolyline(steps: steps, end: endLocation, busId: bus)
        dismiss(animated: true, completion: nil)
    }
}

extension RoutesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routesLegs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configures TableView Cell properties as custom RoutesCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoutesCell", for: indexPath) as! RoutesCell
        let route = self.routesLegs[indexPath.row].legs[0]
        
        cell.departureLabel.text = route.departure_time.text
        cell.arrivalLabel.text = route.arrival_time.text
        cell.distanceLabel.text = route.distance.text
        cell.durationLabel.text = route.duration.text
        return cell
    }
    
    
}
