//
//  AppTrackingBridgeManager.swift
//  TrackingBridge
//
//  Created by Tung Nguyen on 10/29/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class AppTrackingBridgeManager {

    var bridge: TrackingBridgeProtocol!
    
    private static var _shared: AppTrackingBridgeManager?
    
    public static var shared: AppTrackingBridgeManager {
        guard let initializedInstance = _shared else {
            fatalError("AppTrackingBridgeManager has been not initialized")
        }
        return initializedInstance
    }
    
    private init(bridge: TrackingBridgeProtocol) {
        self.bridge = bridge
    }
        
    public static func initialize(withBridge bridge: TrackingBridgeProtocol) {
        _shared = AppTrackingBridgeManager(bridge: bridge)
    }
    
    public func trackAppEvent(appId: String, eventType: String, data: [String : Any]) {
        bridge.trackAppEvent(appId: appId, eventType: eventType, data: data)
    }

}
