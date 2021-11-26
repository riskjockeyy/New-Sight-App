//
//  ContentModel.swift
//  New Sight App
//
//  Created by Bharat Singh on 23/11/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var locationState = CLAuthorizationStatus.notDetermined
    
    @Published var restaurents = [Business]()
    @Published var sights = [Business]()
    
    let locationManager = CLLocationManager()
    
    override init() {
        
        super.init()
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        locationState = locationManager.authorizationStatus
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
        }
        
        else if locationManager.authorizationStatus == .denied {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        
        
        if userLocation != nil {
            
            locationManager.stopUpdatingLocation()
            
            getBusiness(category: Constant.restaruentsKey, location: userLocation!)
            getBusiness(category: Constant.sightsKey, location: userLocation!)
            
        }
  
    }
    func getBusiness(category:String, location: CLLocation) {
        
        var urlComponent = URLComponents(string: Constant.url)
        
        urlComponent?.queryItems = [URLQueryItem(name: "categories", value: category),
                                    URLQueryItem(name: "limit", value: "6"),
                                    URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
                                    URLQueryItem(name: "longitude", value: String(location.coordinate.longitude))]
        
        let url = urlComponent?.url
        
        if url != nil {
         
            var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constant.apiKey)", forHTTPHeaderField: "Authorization")
            
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request) { data, respnse, error in
                
                if error == nil && data != nil  {
                    do {
                        let decoder = JSONDecoder()
                        
                       let results = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        var business =  results.businesses
                        
                        business.sort { (b1, b2) -> Bool in
                            return b1.distance ?? 0 < b2.distance ?? 0
                        }

                        for b in business {
                            b.getImageData()
                        }
                        DispatchQueue.main.async {
                            switch category {
                            case Constant.restaruentsKey:
                                self.restaurents = results.businesses
                            case Constant.sightsKey:
                                self.sights = results.businesses
                            default:
                                break
                            }

                        }
                        
                    }
                    catch {
                        print(error .localizedDescription)
                    }
                    
                }
            }
            dataTask.resume()
            
        }
        
    }
}
