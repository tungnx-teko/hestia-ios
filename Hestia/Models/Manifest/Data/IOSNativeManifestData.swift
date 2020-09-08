//
//  IOSNativeManifestData.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class IOSNativeManifestData: HestiaManifestData {
    public var mainClass: String
    public var initClass: String
    
    enum CodingKeys: String, CodingKey {
        case mainClass, initClass
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mainClass = try values.decode(String.self, forKey: .mainClass)
        initClass = try values.decode(String.self, forKey: .initClass)
        try super.init(from: decoder)
    }
}
