//
//  HestiaAppListResponse.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreNetwork

class HestiaAppListResponse: BaseResponse<TekoIntCode> {
    
    var data: [HestiaApp]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([HestiaApp].self, forKey: .data) ?? []
        try super.init(from: decoder)
    }
}
