//
//  Record.swift
//  AutoDietaryApp
//
//  Created by Weijin on 3/3/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class Record{
    var record: String

    init?(record: String){
        guard !record.isEmpty else {
            return nil
        }

        self.record = record

        
    }
    
}
