//
//  Functions.swift
//  AnimationSample
//
//  Created by Appinventiv on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation
import UIKit

// XIBs

enum xib: String{
    case GridCell = "GridCellID"
    case ListCell = "ListCellID"
}

// DATA

struct UserData {
    var userImage: UIImage
    var imageLabel: String
    
    init(data: [[String: Any]], index: Int) {
        
        userImage = data[index]["image"] as! UIImage
        imageLabel = data[index]["label"] as! String
    }
}





// FUNCTIONS

func getImgSize( image: UIImage) -> CGSize? {
    
    if let height = image.cgImage?.height, let width = image.cgImage?.width{
        let size = CGSize(width: width, height: height)
        return size
    }
    return nil
}

//extension GalleryVC{
//    
////    func didTap(gestureRecogniser : UILongPressGestureRecognizer) -> Void {
////        let point = gestureRecogniser.location(in: self.imgCollectionView)
////        let indexpath = self.imgCollectionView.indexPathForItem(at: point)
////        
////        imgCollectionView.selectItem(at: indexpath, animated: true, scrollPosition: .centeredVertically)
////        
////       collectionView(imgCollectionView, didSelectItemAt: indexpath!)
////        
////    }
//    
//    
//}

// VIEW CASES
enum ViewCases{
    case List
    case Grid
}

var viewCase = ViewCases.List

