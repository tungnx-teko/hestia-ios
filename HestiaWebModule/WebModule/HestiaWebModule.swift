//
//  HestiaWebModule.swift
//  HestiaWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import WebKit

public protocol HestiaWebModule: WKScriptMessageHandler {
    var webView: WKWebView { get }
    
    init(webView: WKWebView)
}
