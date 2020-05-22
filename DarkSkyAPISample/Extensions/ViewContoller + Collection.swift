//
//  ViewContoller + Collection.swift
//  DarkSkyAPISample
//
//  Created by burak on 22.05.2020.
//  Copyright © 2020 burak. All rights reserved.
//

import UIKit

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        return cell
    }
    
    
}
