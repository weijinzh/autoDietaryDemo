//
//  Accounts.swift
//  autoDietary
//
//  Created by Weijin Zhu on 4/23/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import Foundation
import UIKit
class Accounts{
    var usernameData: String
    var passwordData: String

    
    init?(usernameData: String,passwordData:String){
        guard !usernameData.isEmpty else {
            return nil
        }
        guard !passwordData.isEmpty else{
            return nil
        }

        self.usernameData = usernameData
        self.passwordData = passwordData

        
    }
    
}
