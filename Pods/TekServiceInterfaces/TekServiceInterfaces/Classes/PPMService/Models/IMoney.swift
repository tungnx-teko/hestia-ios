//
//  IMoney.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol IMoney {
    var id: Int { get }
    var money: Double? { get }
    var percent: Double? { get }
    var maxDiscount: Double? { get }
    var maxDiscountPerOrder: Double? { get }
    var budgetId: Int? { get }
    var budgetStatus: String? { get }
    var outOfBudget: Bool { get }
    var discountType: String { get }
}
