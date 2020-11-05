//
//  ViewController.swift
//  SuperAppDemo
//
//  Created by Tung Nguyen on 10/29/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import TrackingBridge

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppTrackingBridgeManager.initialize(withBridge: AppTrackingBridge())
    }


}

class AppTrackingBridge: TrackingBridgeProtocol {
    
    func trackAppEvent(appId: String, eventType: String, data: [String : Any]) {
        let trackingData = "\(appId)\n\(eventType)\n\(data)"
        print(trackingData)
    }
    
}
