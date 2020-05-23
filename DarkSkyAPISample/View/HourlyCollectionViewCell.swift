//
//  HourlyCollectionViewCell.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var instantWeatherImg: UIImageView!
    @IBOutlet weak var instantWeatherTempLbl: UILabel!
    
    
    func configureColViewCell(hourly:HourlyData){
        
        self.instantWeatherTempLbl.text = "\(hourly.fahToCel) ℃"
            
        let url = URL(string: hourly.icon!)
        
        if url?.relativePath == "clear-day" {
            self.instantWeatherImg.image = UIImage(named: "clear-day")
        }else if url?.relativePath == "clear-night" {
            self.instantWeatherImg.image = UIImage(named: "clear-night")
        }else if url?.relativePath == "cloudy" {
            self.instantWeatherImg.image = UIImage(named: "cloudy")
        }else if url?.relativePath == "foggy" {
            self.instantWeatherImg.image = UIImage(named: "fig")
        }else if url?.relativePath == "partly-cloudy-day" {
            self.instantWeatherImg.image = UIImage(named: "partly-cloudy-day")
        }else if url?.relativePath == "partly-cloudy-night" {
            self.instantWeatherImg.image = UIImage(named: "partly-cloudy-night")
        }else if url?.relativePath == "rain" {
            self.instantWeatherImg.image = UIImage(named: "rain")
        }else if url?.relativePath == "snow" {
            self.instantWeatherImg.image = UIImage(named: "snow")
        }else{
            self.instantWeatherImg.image = UIImage(named: "unknown")
        }
    }
}
