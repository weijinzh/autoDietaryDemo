//
//  Reminder.swift
//  AutoDietaryApp
//
//  Created by Weijin on 3/3/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class Reminder{
    var item: String
    var image: UIImage?
    var time: String
    var edge: UIImage?
    var categoryImg: UIImage?
    var unit: String
    var descriptionStatic: String
    
    init?(item: String, image: UIImage?,time:String,edge: UIImage?,categoryImg:UIImage?,unit:String,descriptionStatic:String){
        guard !item.isEmpty else {
            return nil
        }
        guard !time.isEmpty else{
            return nil
        }
        guard !unit.isEmpty else{
            return nil
        }
        guard !descriptionStatic.isEmpty else{
            return nil
        }
        self.item = item
        self.image = image
        self.time = time
        self.edge = edge
        self.categoryImg = categoryImg
        self.unit = unit
        self.descriptionStatic = descriptionStatic
        
    }

}
