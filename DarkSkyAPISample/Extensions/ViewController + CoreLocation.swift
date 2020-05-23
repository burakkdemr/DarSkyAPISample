//
//  ViewController + CoreLocation.swift
//  DarkSkyAPISample
//
//  Created by burak on 23.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit
import CoreLocation


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            getWeatherDataForLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        fatalError()
    }
}
