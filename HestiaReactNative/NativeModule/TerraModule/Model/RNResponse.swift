//
//  RNResponse.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class RNResponse {
    private static let KEY_DICTIONARY_SUBSCRIBER_ID = "subscriber_id"
    private static let KEY_DICTIONARY_DATA = "data"
    
    var subscriberId: String = ""
    var data: ResponseData
    
    public init(subscriberId: String, data: ResponseData) {
        self.subscriberId = subscriberId
        self.data = data
    }
    
    func toDictionary() -> [String: Any] {
        return [
            RNResponse.KEY_DICTIONARY_SUBSCRIBER_ID: self.subscriberId,
            RNResponse.KEY_DICTIONARY_DATA: self.data.toDictionary()
        ]
    }
}

public class ResponseData {
    private static let KEY_DICTIONARY_STATUS_CODE = "status_code"
    private static let KEY_DICTIONARY_RESULT = "result"
    private static let KEY_DICTIONARY_ERROR = "error"
       
    
    var statusCode: StatusCode = StatusCode.success
    var result: Any?
    var error: String?

    public init(statusCode: StatusCode, result: Any?, error: String?) {
        self.statusCode = statusCode
        self.result = result
        self.error = error
    }

    func toDictionary() -> [String: Any?] {
        return [
            ResponseData.KEY_DICTIONARY_STATUS_CODE: self.statusCode.toInt(),
            ResponseData.KEY_DICTIONARY_RESULT: self.convertResult(),
            ResponseData.KEY_DICTIONARY_ERROR: self.error
        ]
    }
    
    private func convertResult() -> Any? {
        guard let result = self.result else {
            return nil
        }
        
        if let convertedResult = RNResponseUtils.convertDataToTransfer(self.result) {
            return convertedResult
        } else {
            return result
        }
    }
}

public enum StatusCode {
    case success
    case failure
    case other(value: Int)

    public func toInt() -> Int {
        switch self {
        case .success:
            return 200
        case .failure:
            return 500
        case .other(let value):
            return value
        }
    }
}
