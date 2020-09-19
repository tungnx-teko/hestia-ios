//
//  FileManager+.swift
//  HestiaReactNative
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

let APPS_DIRECTORY_NAME = "rn-apps"

extension FileManager {
    
    static var documentDirectoryURL: URL {
        let documentDirectoryURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL
    }
    
    static var appsDirectoryURL: URL {
        return documentDirectoryURL.appendingPathComponent(APPS_DIRECTORY_NAME)
    }
    
    static func getDirectoryURL(of appCode: String) -> URL {
        return appsDirectoryURL.appendingPathComponent(appCode)
    }
}
