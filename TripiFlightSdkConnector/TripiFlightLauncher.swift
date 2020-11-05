//
//  TripiFlightLauncher.swift
//  TripiFlightSdkConnector
//
//  Created by Tung Nguyen on 10/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import HestiaIOS
import Hestia
import TripiFlightKit

class TripiFlightLauncher: IOSAppLauncher, TripiFlightKitDelegate {
    
    required init(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil) {
        super.init(className: className, launcherData: launcherData, delegate: delegate)
    }
    
    override func create(className: String, launcherData: AppLauncherData, delegate: HestiaDelegate? = nil, completion: @escaping (UIViewController?) -> ()) {
        var config = launcherData.extraConfig
        config["accessToken"] = launcherData.idToken
        print("[Config]: ", config)
        dump(launcherData)
        TripiFlightKit.shared.callFlightSDK(params: config, delegate: self) { (error, viewController) in
            dump(error)
            completion(viewController)
        }

    }
    
    func didBookOrderWith(jsonData: Data?) {
        hestiaDelegate?.callback(data: ["app_id": "tripi_flight", "action": "did_book_order", "result": jsonData ?? Data()])
    }
    
    func didBackFromSDK() {
        hestiaDelegate?.callback(data: ["app_id": "tripi_flight", "action": "did_back"])
    }
    
    
}

