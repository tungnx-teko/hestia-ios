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
    public let icon: String
    public let description: String
    public let code: String
    public let platformCode: String
    public let version: String
    public let manifest: AnyHestiaAppManifest?
    public var type: AppType
    
    enum CodingKeys: String, CodingKey {
        case name, icon, description, code, platformCode, version, manifest
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        icon = try values.decodeIfPresent(String.self, forKey: .icon) ?? ""
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? ""
        platformCode = try values.decodeIfPresent(String.self, forKey: .platformCode) ?? ""
        version = try values.decodeIfPresent(String.self, forKey: .version) ?? ""
        type = AppType(rawValue: code) ?? .native
        switch type {
        case .native:
            let iosAppManifest = try values.decodeIfPresent(IOSAppManifest.self, forKey: .manifest)
            self.manifest = iosAppManifest.map { AnyHestiaAppManifest($0) }
        default:
            self.manifest = nil
        }
    }
    
}

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
