//
//  DailyTableViewCell.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit

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

}
