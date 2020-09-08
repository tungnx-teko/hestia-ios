//
//  WebAppManifestData.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class WebAppManifestData: HestiaManifestData {
    
    public var url: String
    
    enum CodingKeys: String, CodingKey {
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decode(String.self, forKey: .url)
        try super.init(from: decoder)
    }
    
}
