//
//  DataSource.swift
//  ListToGridView
//
//  Created by Appinventiv on 13/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import Foundation

struct Honda {
    let carModel : String
    let carImage : String
    
    init(JSON data : [String:String]) {
        carModel = data["Title"]!
        carImage = data["Image"]!
    }
}
