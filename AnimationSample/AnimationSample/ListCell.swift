//
//  ListCell.swift
//  AnimationSample
//
//  Created by Appinventiv on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    
    @IBOutlet weak var listImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImages(img: UIImage){
        listImage.image = img
    }

}

