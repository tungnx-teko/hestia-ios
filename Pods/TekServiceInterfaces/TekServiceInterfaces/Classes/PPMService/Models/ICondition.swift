//
//  ICondition.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol ICondition {
    var coupon: String? { get }
    var paymentMethods: [String] { get }
    var orderValueMin: Double? { get }
    var orderValueMax: Double? { get }
    var blockSize: Int { get }
    var minQuantity: Int { get }
}
