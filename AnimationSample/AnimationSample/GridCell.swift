//
//  GridCell.swift
//  AnimationSample
//
//  Created by Appinventiv on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    
    @IBOutlet weak var gridImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImages(img: UIImage){
        gridImage.image = img
    }

}


