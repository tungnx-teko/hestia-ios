//
//  HestiaAppManifest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol HestiaAppManifest {
    associatedtype DataType: HestiaManifestData
    
    var data: DataType? { get }
    var extra: [String: Any]? { get }
}
