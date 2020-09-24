//
//  ReactNativeAppManifest.swift
//  Hestia
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class ReactNativeAppManifest: HestiaAppManifest, Decodable {
    public typealias DataType = ReactNativeAppManifestData
    
    public let data: ReactNativeAppManifestData?
    public let extra: [String: Any]?
    
    enum CodingKeys: String, CodingKey {
        case data
        case extra
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ReactNativeAppManifestData.self, forKey: .data)
        extra = try values.decodeIfPresent([String: Any].self, forKey: .extra)
    }
    
    init(data: ReactNativeAppManifestData?, extra: [String: Any]?) {
        self.data = data
        self.extra = extra
    }
    
}
