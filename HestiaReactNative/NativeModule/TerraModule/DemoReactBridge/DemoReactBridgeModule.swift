//
//  DemoReactBridgeModule.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class DemoReactBridgeModule: BaseReactBridgeModule {
    
    @objc
    override func getModuleName() -> String {
        return "DemoModule"
    }

    @objc(testrequest:)
    func test(_ request: RNRequest) {
        eventEmitter.sendSuccessEvent(
            for: getModuleName(),
            to: request.subscriberId,
            result: ["result_code": "ok"]
        )
    }
    
}
