//
//  BaseNativeBridge.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import React

typealias Unsubscribe = () -> Void

class BaseReactBridgeModule : NSObject {

    let eventEmitter: EventEmitter

    private var subscribers: [String: Unsubscribe] = [:]

    init(eventEmitter: EventEmitter) {
        self.eventEmitter = eventEmitter
    }

    func getModuleName() -> String {
        return "AbstractBridgeModule"
    }

    func unsubscribe(subscriberId: String) {
        subscribers.removeValue(forKey: subscriberId)
    }

    func addSubscriber(subscriberId: String, unsubscribe: @escaping Unsubscribe) {
        subscribers[subscriberId] = unsubscribe
    }
}
