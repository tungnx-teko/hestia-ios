//
//  Date+.swift
//  HestiaReactNative
//
//  Created by batu on 9/23/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

extension Date {
    static func getCurrentMillis() -> Int64 {
        return Int64(NSDate().timeIntervalSince1970 * 1000)
    }
}
