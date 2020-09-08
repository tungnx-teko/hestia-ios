//
//  DemoModule.swift
//  DemoWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import WebKit
import HestiaWebModule

class DemoModule: NSObject, HestiaWebModule {
    
    var webView: WKWebView
    
    required init(webView: WKWebView) {
        self.webView = webView
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body as? String ?? "")
        guard let body = message.body as? [String : Any] else { return }
        let method = body["method"] as! String
        switch method {
        case "test":
            let requestString = body.jsonStringRepresentation ?? ""
            test(requestString: requestString)
        default:
            print("Wrong func")
        }
    }
    
    
    
    @objc
    func test(requestString: String) {
        let data = requestString.data(using: .utf8)!
        let request = try! JSONDecoder().decode(WebRequest.self, from: data)
        
        let result = WebResponse(result: "")
        
        let encoded = try! JSONEncoder().encode(result)
        
        let jsonString = String(data: encoded, encoding: .utf8)!

        webView.evaluateJavaScript("javascript:window.\(request.callback)(\(jsonString))") { (_, _) in }
        
    }
    
}

extension Dictionary {
    var jsonStringRepresentation: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
                                                                return nil
        }
        
        return String(data: theJSONData, encoding: .ascii)
    }
}
