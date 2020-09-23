//
//  BaseReactBridgeModuleFactory.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

public class BaseReactBridgeModuleFactory {
    private(set) var eventEmitter: EventEmitter!
    
    required public init() {}

    func withEventEmitter(eventEmitter: EventEmitter) {
        self.eventEmitter = eventEmitter
    }

    func createBridgeModule() -> BaseReactBridgeModule {
        return BaseReactBridgeModule(eventEmitter: eventEmitter)
    }
}
