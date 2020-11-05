//
//  TrackingBridgeProtocol.swift
//  TrackingBridge
//
//  Created by Tung Nguyen on 10/29/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol TrackingBridgeProtocol {
    func trackAppEvent(appId: String, eventType: String, data: [String: Any])
}
