//
//  TerraModule.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import React
import Hestia

@objc(TerraModule)
class TerraModule : RCTEventEmitter {

    private var loadedBridgeModules: [BaseReactBridgeModule] = []

    private var eventEmitter: EventEmitter!

    override init() {
        super.init()
        eventEmitter = EventEmitter(reactEventEmitter: self)
        loadBridgeModules()
    }

    @objc
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }

    @objc
    func invoke(_ moduleName: String, methodName: String, subscriberId: String, requestString: String) {
        do {
            let bridgeModule = try getBridgeModule(moduleName: moduleName)
            let request = try JSONDecoder().decode(RNRequest.self, from: requestString.data(using: .utf8)!)

            let methodSelector = NSSelectorFromString("\(methodName)request:")
            
            if bridgeModule.responds(to: methodSelector) {
                bridgeModule.perform(methodSelector, with: request)
            } else {
                throw NoSuchMethodError(moduleName: moduleName, methodName: methodName)
            }
        } catch let error as NoSuchModuleError {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: error.message)
        } catch let error as NoSuchMethodError {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: error.message)
        } catch is DecodingError {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: "Invalid parameters: \(requestString)")
        } catch {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: error.localizedDescription)
        }
    }

    @objc
    func unsubscribe(_ moduleName: String, subscriberId: String) {
        do {
            try getBridgeModule(moduleName: moduleName).unsubscribe(subscriberId: subscriberId)
        } catch let error as NoSuchModuleError {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: error.message)
        } catch {
            eventEmitter.sendErrorResponse(for: moduleName, to: subscriberId, error: error.localizedDescription)
        }
    }

    override func supportedEvents() -> [String]! {
        return loadedBridgeModules.map { $0.getModuleName() }
    }

    private func loadBridgeModules() {
        let factories = Runtime.subclasses(of: BaseReactBridgeModuleFactory.self).compactMap { $0 as? BaseReactBridgeModuleFactory.Type }
        factories.forEach {
            let factory = $0.init()
            factory.withEventEmitter(eventEmitter: eventEmitter)
            loadedBridgeModules.append(factory.createBridgeModule())
        }
    }

    private func getBridgeModule(moduleName: String) throws -> BaseReactBridgeModule {
        if let foundModule = loadedBridgeModules.first(where: { $0.getModuleName() == moduleName }) {
            return foundModule
        } else {
            throw NoSuchModuleError(moduleName: moduleName)
        }
    }
}
