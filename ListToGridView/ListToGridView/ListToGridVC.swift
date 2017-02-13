//
//  ListToGridVC.swift
//  ListToGridView
//
//  Created by Appinventiv on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit


class ListToGridVC: UIViewController {
    
    
    // Cars Data
    let carsData : [[String:String]] = [
        ["Title" : "CITY",      "Image" : "City"],
        ["Title" : "CIVIC",     "Image" : "Civic"],
        ["Title" : "ACCORD",    "Image" : "Accord"]
    ]
    
    // IBOutlets
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    
    @IBOutlet weak var toggleListToGridOutlet: UIButton!
    
    
    //Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.carsCollectionView.delegate = self
        self.carsCollectionView.dataSource = self
        
        
        // Grid View Nib Initialization
        
        let gridViewNib = UINib.init(nibName: "GridViewCell", bundle: nil)
        carsCollectionView.register(gridViewNib, forCellWithReuseIdentifier: "GridViewCellID")
        
        // List View Nib Initialization
        
        let listViewNib = UINib.init(nibName: "ListViewCell", bundle: nil)
        carsCollectionView.register(listViewNib, forCellWithReuseIdentifier: "ListViewCellID")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Toggle List To Grid or Grid To List
   
    @IBAction func toggleListToGrid(_ sender: UIButton){
        
        if toggleListToGridOutlet.isSelected == true{
            toggleListToGridOutlet.isSelected = false
            
            UIView.setAnimationDuration(1)
            
        }else{
            
            toggleListToGridOutlet.isSelected = true
            
            UIView.setAnimationDuration(1)
            
        }
        
        carsCollectionView.reloadData()
        
    }

}

// MARK: DataSource and DataDelegate Methods

extension ListToGridVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return carsData.count + 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        
        switch indexPath.row {
            case 0:
            
                // Display HONDA Label
                let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "HondaLabelCellID", for: indexPath) as! HondaLabelCell
                return cell
            
            default:
                
                if toggleListToGridOutlet.isSelected == true{
                
                    let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "ListViewCellID", for: indexPath) as! ListViewCell
                    let dataModel = Honda(JSON: carsData[indexPath.row-1])
            
                    cell.setData(dataModel)
                    
                    return cell
            
                }else {
                    let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "GridViewCellID", for: indexPath) as! GridViewCell
                    let dataModel = Honda(JSON: carsData[indexPath.row-1])

                    cell.setData(dataModel)
                    
                    return cell
                }
            
        }

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        switch indexPath.row {
        case 0:
            
            let cellSize = CGSize(width: 375.0, height: 40.0)
            return cellSize
            
        default:
            
            if toggleListToGridOutlet.isSelected == true{
                
                let cellSize = CGSize(width: 375.0, height: 170.0)
                return cellSize
                
            }else {
                let cellSize = CGSize(width: 170.0, height: 150.0)
                return cellSize
            }
            
        }
    }
}

class HondaLabelCell: UICollectionViewCell {
    
    @IBOutlet weak var hondaLabel: UILabel!
    
}
