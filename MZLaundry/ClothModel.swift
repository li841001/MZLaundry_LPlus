//
//  ClothModel.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/24.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class ClothModel: NSObject {

    var name = ""
    var price = 0
    var id = 0
    var avarta = ""
    var count = 0
    var type: WashType!
    
    override init() {
        self.type = .BAG
    }
    
    init(type:WashType) {
        self.type = type
        if type == .BAG {
            self.name = "袋洗"
            self.price = 68
            self.avarta = "6"
        }
    }
}

enum WashType{
    case CATAGORY
    case BAG
}