//
//  DemoReactBridgeModuleFactory.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class DemoReactBridgeModuleFactory: BaseReactBridgeModuleFactory {

    override func createBridgeModule() -> BaseReactBridgeModule {
        return DemoReactBridgeModule(eventEmitter: eventEmitter)
    }

}
