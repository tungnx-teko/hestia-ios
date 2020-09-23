//
//  RNRequest.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class RNRequest: NSObject, Decodable {
    public var subscriberId: String = ""
    public var parameters: [String: Any] = [:]
    
    enum CodingKeys: String, CodingKey {
        case subscriberId, parameters
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        subscriberId = try values.decodeIfPresent(String.self, forKey: .subscriberId) ?? ""
        parameters = try values.decodeIfPresent([String: Any].self, forKey: .parameters) ?? [:]
    }
    
}
