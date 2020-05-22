//
//  ViewContoller + Table.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 20
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyTableViewCell", for: indexPath) as! DailyTableViewCell
        return cell
     }
}
