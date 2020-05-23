//
//  ViewController.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var weatherForecast: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    var weatherResponse: WeatherResponse?
    var currentWeather: CurrentResponse?
    var hourlyWeather = [HourlyData]()
    var dailyWeather = [DailyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDataSourcesAndDelegates()
    }
    

    func setupDataSourcesAndDelegates(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.searchBar.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
    func getWeatherDataForLocation(){
        guard let currentLocation = currentLocation else {return}
        
        let apiKey = "3490712fcb09cd07ef06714df5e7430f"
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        let url = URL(string: "https://api.darksky.net/forecast/\(apiKey)/\(lat),\(long)?exclude=[flags,minutely]")
        guard let baseURL = url else {return}
        
        URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            guard let data = data, response != nil, error == nil else {fatalError()}
            do{
                self.weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                
            }catch{
                print("error \(error)")
            }
            
            guard let result = self.weatherResponse else {return}
            
            let daily = result.daily.data
//            self.dailyWeather.append(contentsOf: daily!)
            self.dailyWeather = daily!
       
            let currently = result.currently
            self.currentWeather = currently
            
            let hourly = result.hourly.data
//            self.hourlyWeather.append(contentsOf: hourly!)
            self.hourlyWeather = hourly!
            
            let location = result.timezone
            DispatchQueue.main.async {
                 self.locationLbl.text = location
            }
           
            let forecast = result.currently.summary
            DispatchQueue.main.async {
                self.weatherForecast.text = forecast
            }
            
            let temp = result.currently.temperature
            DispatchQueue.main.async {
                var fahToCel:String{
                        let cell = String(format: "%.2f", (temp - 32) * 5/9)
                        return cell
                    }
                self.currentTemp.text = "\(fahToCel)℃"
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.collectionView.reloadData()
            }
            
        }.resume()
    }
    
}

