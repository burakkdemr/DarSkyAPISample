//
//  ViewController.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var weatherForecast: UILabel!
    @IBOutlet weak var temprature: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
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
    }
    
}

