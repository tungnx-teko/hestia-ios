//
//  HestiaConfigConverter.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreService

public class HestiaConfigConverter: BaseServiceConverter<HestiaConfig> {
    
    public override func convertConfig(rawValue: [String : Any]) -> HestiaConfig {
        return HestiaConfig(url: rawValue["url"] as? String ?? "",
                            clientId: rawValue["url"] as? String ?? "")
    }
    
}
