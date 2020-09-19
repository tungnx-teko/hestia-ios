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
    
    static func createFileIfNotExists(file: URL) throws {
        if !fileManager.fileExists(atPath: file.path) {
            try createParentDirectory(for: file)
            fileManager.createFile(atPath: file.path, contents: nil, attributes: nil)
        }
    }

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
            let parentDirectory = file.deletingLastPathComponent()
            if !fileManager.fileExists(atPath: parentDirectory.path) {
                try fileManager.createDirectory(at: parentDirectory, withIntermediateDirectories: true, attributes: nil)
            }
        }
    }
}
