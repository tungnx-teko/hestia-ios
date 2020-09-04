//
//  HestiaError.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public enum HestiaError: Error {
    case invalidCode
    case appNotFound
    case unexpected
    case exchangeTokenFailed
    case invalidManifestData
}
