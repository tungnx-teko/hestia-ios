//
//  Bundle.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

class HestiaBundle {
    
    static let shared = Bundle(for: HestiaBundle.self)
    
    static func getImage(named: String) -> UIImage? {
        return UIImage(named: named, in: shared, compatibleWith: nil)
    }
    
    static func loadNibNamed(_ nibName: String, owner: Any?) -> [Any]? {
        return shared.loadNibNamed(nibName, owner: owner, options: nil)
    }
    
}
