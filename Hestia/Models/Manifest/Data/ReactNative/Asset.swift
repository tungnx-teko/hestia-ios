//
//  Asset.swift
//  Hestia
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public struct Asset: Decodable {
    public var id: String
    public var name: String
    public var type: String
    public var checksum: String
    public var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, type, checksum, createdAt
    }
}
