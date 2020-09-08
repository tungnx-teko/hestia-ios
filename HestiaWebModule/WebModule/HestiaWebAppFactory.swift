//
//  HestiaWebAppFactory.swift
//  HestiaWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import WebKit

public protocol HestiaWebAppFactory {
    var moduleName: String { get }
    
    init()
    func getModule(webView: WKWebView) -> HestiaWebModule
}

extension HestiaWebAppFactory {
    
    public func configure(webView: WKWebView) {
//        let source = "function captureLog(msg) { window.webkit.messageHandlers.logHandler.postMessage(msg); } window.console.log = captureLog;"
//        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
//        webView.configuration.userContentController.addUserScript(script)
        
        // register the bridge script that listens for the output
        webView.configuration.userContentController.add(getModule(webView: webView), name: "logHandler")
        webView.configuration.userContentController.add(getModule(webView: webView), name: moduleName)
        webView.evaluateJavaScript("javascript:window.\(moduleName)=\(moduleName)") { (_, _) in }
    }
    
}
