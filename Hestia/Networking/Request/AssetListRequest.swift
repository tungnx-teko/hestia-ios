//
//  AssetListRequest.swift
//  Hestia
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork

struct AssetListRequest: BaseRequestProtocol {
    
    typealias ResponseType = AssetListResponse
    
    let clientId: String
    
    let appCode: String
    
    let appVersion: String
    
    let assetIds: [String]
    
    enum ParamKey: String {
        case appVersion, assetIds
    }
    
    var encoder: APIParamEncoder {
        let params = ["appVersion": appVersion,
                      "assetIds": assetIds.joined(separator: ":")]
        
        return .singleParams(params, encoding: URLParamEncoding.default)
    }
    
    var method: APIMethod {
        return .get
    }
    
    var path: String {
        return "/api/v1/hestia/\(clientId)/\(appCode)/assets"
    }
    
    var hasToken: Bool {
        return false
    }
    
    init(clientId: String, appCode: String, appVersion: String, assetIds: [String]) {
        self.clientId = clientId
        self.appCode = appCode
        self.appVersion = appVersion
        self.assetIds = assetIds
    }
    
    
}
