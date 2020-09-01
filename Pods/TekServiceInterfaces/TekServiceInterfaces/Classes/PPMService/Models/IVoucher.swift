//
//  IVoucher.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol IVoucher {
    var quantity: Int { get }
    var maxQuantity: Int { get }
    var outOfBudget: Bool { get }
    var budgetStatus: String { get }
    var appliedPromotion: IAppliedPromotion? { get }
}
