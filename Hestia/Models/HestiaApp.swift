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
        type = AppType(rawValue: platformCode) ?? .native
        switch type {
        case .native:
            let iosAppManifest = try values.decodeIfPresent(IOSAppManifest.self, forKey: .manifest)
            self.manifest = iosAppManifest.map { AnyHestiaAppManifest($0) }
        case .webView:
            let webAppManifest = try values.decodeIfPresent(WebAppManifest.self, forKey: .manifest)
            self.manifest = webAppManifest.map { AnyHestiaAppManifest($0) }
        case .reactNative:
            let reactNativeAppManifest = try values.decodeIfPresent(ReactNativeAppManifest.self, forKey: .manifest)
            self.manifest = reactNativeAppManifest.map { AnyHestiaAppManifest($0) }
        }
    }
    
}

let mockApps: [HestiaApp] = {
    let json = """
        [
            {
                "name":"Native Test",
                "code":"app_1",
                "description":"",
                "platformCode":"ios_native",
                "version":"0.0.1",
                "manifest":{
                    "data": {
                        "iamAudience": "tripi-flight:1b14898e-4de6-4bde-a986-1eac5f7ae37b",
                        "@type":"ios_native",
                        "mainClass": "MiniAppSdk.ViewController",
                        "initClass": "MiniAppSdk.MiniAppLauncher"
                    }
                }
            },
            {
                "name":"Demo Web app",
                "code":"app_2",
                "description":"",
                "platformCode":"web",
                "version":"",
                "manifest":{
                    "data": {
                        "iamAudience": "tripi-flight:1b14898e-4de6-4bde-a986-1eac5f7ae37b",
                        "@type":"web",
                        "url":"https://nhan-vien-phong-vu-dev2.firebaseapp.com"
                    }
                }
            },
        ]
        """
    let data = json.data(using: .utf8)!
    let apps = try! JSONDecoder().decode([HestiaApp].self, from: data)
    return apps
}()
