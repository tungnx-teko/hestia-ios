//
//  IOSAppManifest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class IOSAppManifest: HestiaAppManifest, Decodable {
    public typealias DataType = IOSNativeManifestData
    
    public let data: IOSNativeManifestData?
    public let extra: [String: Any]?
    
    enum CodingKeys: String, CodingKey {
        case data
        case extra
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(IOSNativeManifestData.self, forKey: .data)
        extra = try values.decodeIfPresent([String: Any].self, forKey: .extra)
    }
    
}
