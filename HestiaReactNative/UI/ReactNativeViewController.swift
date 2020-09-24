//
//  ReactNativeViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import React
import Hestia

class ReactNativeViewController : UIViewController, RCTExceptionsManagerDelegate {

    var mainJsBundleUrl: URL? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        openMainJsBundle()
    }

    private func setupView() {
        view.backgroundColor = .white
    }

    private func openMainJsBundle() {
        guard let mainJsBundleUrl = self.mainJsBundleUrl else {
            return
        }

        let bridge = RCTBridge.init(
            bundleURL: mainJsBundleUrl,
            moduleProvider: {
                [RCTExceptionsManager.init(delegate: self)]
            },
            launchOptions: nil
        )
        let rootView: RCTRootView = RCTRootView(
            bridge: bridge!,
            moduleName: LocalAppConfig.moduleName,
            initialProperties: nil)
        rootView.clipsToBounds = true
        self.view = rootView
    }

    func handleSoftJSException(withMessage message: String?, stack: [Any]?, exceptionId: NSNumber) {
        // TODO: Track error
    }

    func handleFatalJSException(withMessage message: String?, stack: [Any]?, exceptionId: NSNumber) {
        // TODO: Track error
    }
}
