//
//  WebRequest.swift
//  HestiaWebModule
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public class WebRequest: Decodable {
    public var callback: String = ""
    public var method: String = ""
    public var module: String = ""
    public var parameters: [String: Any] = [:]
    
    enum CodingKeys: String, CodingKey {
        case callback, method, module, parameters
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        callback = try values.decodeIfPresent(String.self, forKey: .callback) ?? ""
        method = try values.decodeIfPresent(String.self, forKey: .method) ?? ""
        module = try values.decodeIfPresent(String.self, forKey: .module) ?? ""
        parameters = try values.decodeIfPresent([String: Any].self, forKey: .parameters) ?? [:]
    }
    
}
