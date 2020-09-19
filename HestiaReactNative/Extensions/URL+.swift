//
//  URL+.swift
//  HestiaReactNative
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

extension URL {

    func createDirectoryIfNotExists() {
        do {
            try FileManager.default.createDirectory(at: self, withIntermediateDirectories: true, attributes: nil)
        } catch {
            
        }
    }

}
