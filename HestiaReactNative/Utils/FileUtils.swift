//
//  FileUtils.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class FileUtils {
    private static let fileManager = FileManager.default

    static func removeItemIfExists(atPath destination: URL) throws {
        if fileManager.fileExists(atPath: destination.path) {
            try fileManager.removeItem(at: destination)
        }
    }
    
    static func createDirectory(at path: URL) throws {
        try fileManager.createDirectory(at: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    static func createParentDirectory(for file: URL) throws {
        if (file.isFileURL) {
            let destinationDirectory = file.deletingLastPathComponent()
            if !fileManager.fileExists(atPath: destinationDirectory.path) {
                try fileManager.createDirectory(at: file, withIntermediateDirectories: true, attributes: nil)
            }
        }
    }
}
