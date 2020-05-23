//
//  DailyTableViewCell.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit
import AlamofireImage

class DailyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblLowTemp: UILabel!
    @IBOutlet weak var lblHighTemp: UILabel!
    @IBOutlet weak var instantWeatherDailyImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureTableViewCell(daily:DailyData){
        self.lblDay.text = getDay(date: Date(timeIntervalSince1970: Double(daily.time)))
        self.lblLowTemp.text = "\(daily.lowTemp) ℃"
        self.lblHighTemp.text = "\(daily.highTemp) ℃"
        
        
        let url = URL(string: daily.icon)
        print("GUNLUK \(url!)")
        
        if url?.relativePath == "clear-day" {
            self.instantWeatherDailyImg.image = UIImage(named: "clear-day")
        }else if url?.relativePath == "clear-night" {
            self.instantWeatherDailyImg.image = UIImage(named: "clear-night")
        }else if url?.relativePath == "cloudy" {
            self.instantWeatherDailyImg.image = UIImage(named: "cloudy")
        }else if url?.relativePath == "foggy" {
            self.instantWeatherDailyImg.image = UIImage(named: "fig")
        }else if url?.relativePath == "partly-cloudy-day" {
            self.instantWeatherDailyImg.image = UIImage(named: "partly-cloudy-day")
        }else if url?.relativePath == "partly-cloudy-night" {
            self.instantWeatherDailyImg.image = UIImage(named: "partly-cloudy-night")
        }else if url?.relativePath == "rain" {
            self.instantWeatherDailyImg.image = UIImage(named: "rain")
        }else if url?.relativePath == "snow" {
            self.instantWeatherDailyImg.image = UIImage(named: "snow")
        }else{
            self.instantWeatherDailyImg.image = UIImage(named: "unknown")
        }
        
        
        
        
    }
    
    func getDay(date:Date?) -> String{
        guard let date = date else {return "unknown"}
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
}

