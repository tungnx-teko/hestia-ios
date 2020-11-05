//
//  Manifest.swift
//  HestiaReactNativeTests
//
//  Created by batu on 11/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class Manifest {
    var version: String
    var data: ManifestData
    
    init(version: String, data: ManifestData) {
        self.version = version
        self.data = data
    }
}

class ManifestData {
    var type = "manifest-data"
    var assets: [Asset]
    
    init(assets: [Asset]) {
        self.assets = assets
    }
}

class Asset {
    var url: String
    var name: String
    
    init(url: String, name: String) {
        self.url = url
        self.name = name
    }
}
