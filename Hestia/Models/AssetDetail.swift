//
//  AssetDetail.swift
//  Hestia
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public struct AssetDetail: Decodable  {
    var id: String
    var name: String
    var content: String
    var type: String

    enum CodingKeys: String, CodingKey {
        case id, name, content, type
    }
}
