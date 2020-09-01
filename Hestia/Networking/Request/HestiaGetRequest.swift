//
//  HestiaGetRequest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork

struct HestiaGetRequest: BaseRequestProtocol {
    
    typealias ResponseType = HestiaAppDetailResponse
    
    let clientId: String
    let appCode: String
    
    var encoder: APIParamEncoder {
        return .singleParams([:], encoding: URLParamEncoding.default)
    }
    
    var method: APIMethod {
        return .get
    }
    
    var path: String {
        return "/api/v1/hestia/\(clientId)/\(appCode)"
    }
    
    var hasToken: Bool {
        return false
    }
    
    init(clientId: String, appCode: String) {
        self.clientId = clientId
        self.appCode = appCode
    }
    
    
}
