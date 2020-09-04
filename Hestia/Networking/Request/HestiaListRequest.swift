//
//  HestiaListRequest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork
import Janus

struct HestiaListRequest: BaseRequestProtocol {
    
    typealias ResponseType = HestiaAppListResponse
    
    let clientId: String
    
    var encoder: APIParamEncoder {
        return .singleParams([:], encoding: URLParamEncoding.default)
    }
    
    var method: APIMethod {
        return .get
    }
    
    var path: String {
        return "/api/v1/hestia/\(clientId)"
    }
    
    var hasToken: Bool {
        return false
    }
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    
}

