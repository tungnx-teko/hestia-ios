//
//  ReactNativeManifestData.swift
//  Hestia
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class ReactNativeAppManifestData: HestiaManifestData {
    
    public var assets: [Asset]
    
    enum CodingKeys: String, CodingKey {
        case assets
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        assets = try values.decode([Asset].self, forKey: .assets)
        try super.init(from: decoder)
    }
    
}
