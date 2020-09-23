//
//  EventEmitter.swift
//  HestiaReactNative
//
//  Created by batu on 9/23/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import React

let STREAM_TERMINATED_EVENT = "STREAM_TERMINATED"

class EventEmitter {
    private let reactEventEmitter: RCTEventEmitter
    
    init(reactEventEmitter: RCTEventEmitter) {
        self.reactEventEmitter = reactEventEmitter
    }

    func sendSuccessEvent<T: Encodable>(for moduleName: String, to subscriberId: String, result: T?) {
        let responseData = ResponseData(
            statusCode: .success,
            result: result,
            error: nil
        )
        
        sendResponseResult(for: moduleName, to: subscriberId, with: responseData)
    }
    
    func sendErrorResponse(for moduleName: String, to subscriberId: String, error: String) {
        let responseData = ResponseData<String>(
            statusCode: .failure,
            result: nil,
            error: error
        )
        
        sendResponseResult(for: moduleName, to: subscriberId, with: responseData)
    }
    
    func sendTerminateResponse(for moduleName: String, to subscriberId: String, error: String) {
        let responseData = ResponseData<[String: String]>(
           statusCode: .success,
           result: ["event": STREAM_TERMINATED_EVENT],
           error: nil
       )
        
        sendResponseResult(for: moduleName, to: subscriberId, with: responseData)
    }
    
    func sendResponseResult<T: Encodable>(for moduleName: String, to subscriberId: String, with response: ResponseData<T>) {
        reactEventEmitter.sendEvent(
            withName: moduleName,
            body: RNResponse(subscriberId: subscriberId, data: response).toDictionary()
        )
    }
}
