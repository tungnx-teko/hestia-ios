//
//  HestiaApp.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class HestiaApp: Decodable {
    public let name: String
    public let description: String
    public let code: String
    public let platformCode: String
    public let version: String
    public let manifest: HestiaAppManifest?
    
    public var type: AppType {
        return AppType(rawValue: platformCode) ?? .native
    }
    
    enum CodingKeys: String, CodingKey {
        case name, description, code, platformCode, version, manifest
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? ""
        platformCode = try values.decodeIfPresent(String.self, forKey: .platformCode) ?? ""
        version = try values.decodeIfPresent(String.self, forKey: .version) ?? ""
        manifest = try values.decodeIfPresent(HestiaAppManifest.self, forKey: .manifest)
    }
    
}
