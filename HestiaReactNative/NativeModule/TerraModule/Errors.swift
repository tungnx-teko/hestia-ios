//
//  Errors.swift
//  HestiaReactNative
//
//  Created by batu on 9/23/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

protocol ModuleError: Error {
    var message: String { get }
}

class NoSuchModuleError : ModuleError {

    var message: String {
        get {
            return "No such module found: \(moduleName)"
        }
    }
    
    private let moduleName: String
    
    init(moduleName: String) {
        self.moduleName = moduleName
    }
}

class NoSuchMethodError : ModuleError {
    
    var message: String {
        get {
            return "Method \(methodName) in \(moduleName) module"
        }
    }
    
    private let moduleName: String
    private let methodName: String
    
    init(moduleName: String, methodName: String) {
        self.moduleName = moduleName
        self.methodName = methodName
    }
}
