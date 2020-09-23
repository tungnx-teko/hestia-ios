//
//  HestiaReactNative.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import UIKit
import React

@objc(HestiaModule)
class HestiaModule: NSObject {

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }

    @objc
    func finish() {
        DispatchQueue.main.async {
            if let rootVC = HestiaReactNativeApplication.shared.rootViewController {
                rootVC.dismiss(animated: true)
            }
        }
    }
    
    @objc
    func handleException(_ message: String, stacktrace: String) {
        HestiaReactNativeApplication.shared.rootViewController?.openErrorScreen()
    }
}
