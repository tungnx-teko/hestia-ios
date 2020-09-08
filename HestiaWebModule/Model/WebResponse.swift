//
//  WebResponse.swift
//  HestiaWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class WebResponse: Encodable {
    var statusCode: Int = 0
    var result: String?
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case result
        case error
    }
    
    
    public init(statusCode: Int = 200, result: String?) {
        self.statusCode = statusCode
        self.result = "Tung test"
    }
}
