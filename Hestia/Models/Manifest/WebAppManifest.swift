//
//  WebAppManifest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class WebAppManifest: HestiaAppManifest, Decodable {
    public typealias DataType = WebAppManifestData
    
    public let data: WebAppManifestData?
    public let extra: [String: Any]?
    
    enum CodingKeys: String, CodingKey {
        case data
        case extra
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(WebAppManifestData.self, forKey: .data)
        extra = try values.decodeIfPresent([String: Any].self, forKey: .extra)
    }
    
    init(data: WebAppManifestData?, extra: [String: Any]?) {
        self.data = data
        self.extra = extra
    }
    
}
