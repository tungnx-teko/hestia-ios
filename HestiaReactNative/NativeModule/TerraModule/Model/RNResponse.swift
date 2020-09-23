//
//  RNResponse.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class RNResponse<T: Encodable>: Encodable {
    var subscriberId: String = ""
    var data: ResponseData<T>
    
    enum CodingKeys: String, CodingKey {
        case subscriberId = "subscriber_id"
        case data
    }
    
    public init(subscriberId: String, data: ResponseData<T>) {
        self.subscriberId = subscriberId
        self.data = data
    }
}

public class ResponseData<T: Encodable>: Encodable {
    var statusCode: StatusCode = StatusCode.success
    var result: T?
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case result
        case error
    }

    public init(statusCode: StatusCode, result: T?, error: String?) {
        self.statusCode = statusCode
        self.result = result
        self.error = error
    }

}

public enum StatusCode: Encodable {
    case success
    case failure
    case other(value: Int)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .success:
            try container.encode(200)
        case .failure:
            try container.encode(500)
        case .other(let value):
            try container.encode(value)
        }
    }
}
