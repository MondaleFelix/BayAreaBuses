//
//  NetworkManager.swift
//  BayAreaBuses
//
//  Created by Mondale on 3/26/21.
//

import UIKit

class NetworkManager {
    
    // Creates singleton
    static let shared = NetworkManager()
    private init(){}

    let baseURL = "https://maps.googleapis.com/maps/api/directions/"
    
    
    func getRoutes(start: String, end: String, completed: @escaping(Result<[RoutesLegs], ErrorMessage>) -> Void){
        
        let endpoint = baseURL + "json?origin=\(start)&destination=\(end)&mode=transit&transit_mode=bus&alternatives=true&key=\(apiKey)"
        
        print(endpoint)
        // Returns if URL is invalid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Returns if error exists
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Returns if response is not successful status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Returns if data is invalid
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // Tries to decode data, throws failure if invalid
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(RoutesList.self, from: data)
                let routeLegs = response.routes
                
                completed(.success(routeLegs))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
