//
//  HestiaCode.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork

class HestiaCode: TekoBoolCode {

    required init(from decoder: Decoder) throws {
        super.init(code: true, message: nil)
    }
    
}
