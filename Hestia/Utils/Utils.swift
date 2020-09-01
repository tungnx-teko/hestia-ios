//
//  Utils.swift
//  Hestia
//
//  Created by Tung Nguyen on 8/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class Utils {
    
    static func classForName(_ className: String) -> AnyClass? {
        return NSClassFromString(className)
    }
    
}

