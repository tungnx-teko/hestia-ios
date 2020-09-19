//
//  AssetDetail.swift
//  Hestia
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public struct AssetDetail: Decodable  {
    public var id: String
    public var name: String
    public var content: String
    public var type: String

    enum CodingKeys: String, CodingKey {
        case id, name, content, type
    }
}
