//
//  AssetListResponse.swift
//  Hestia
//
//  Created by batu on 9/17/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork

class AssetListResponse: BaseResponse<HestiaCode> {
    
    var data: [AssetDetail]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([AssetDetail].self, forKey: .data) ?? []
        try super.init(from: decoder)
    }
    
}
