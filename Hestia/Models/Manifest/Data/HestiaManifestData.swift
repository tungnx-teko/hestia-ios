//
//  HestiaManifestData.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class HestiaManifestData: Decodable {
    public var type: String = ""
    public var iamAudience: String = ""
    
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case iamAudience
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
        iamAudience = try values.decode(String.self, forKey: .iamAudience)
    }
}
