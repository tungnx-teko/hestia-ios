//
//  LocalApp.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

struct LocalApp: Decodable {
    var code: String
    var version: String
    var assets: [LocalAsset]
}
