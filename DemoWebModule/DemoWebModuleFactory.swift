//
//  DemoWebModuleFactory.swift
//  DemoWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import HestiaWebModule
import WebKit

class DemoWebModuleFactory: HestiaWebAppFactory {
    
    var moduleName: String = "DcaWebModule"
    
    required init() {}
    
    func getModule(webView: WKWebView) -> HestiaWebModule {
        return DemoModule(webView: webView)
    }

}
