//
//  GridViewCell.swift
//  ListToGridView
//
//  Created by Appinventiv on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class GridViewCell: UICollectionViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    
    @IBOutlet weak var carModel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ data: Honda){
        
        carModel.text = data.carModel
        carImage.image = UIImage(named: data.carImage)
    }

}
