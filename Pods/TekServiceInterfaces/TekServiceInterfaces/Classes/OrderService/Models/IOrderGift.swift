//
//  IOrderGift.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderGift {
    var sku: String? { get }
    var name: String? { get }
    var displayName: String? { get }
    var quantity: Int { get }
    var sellerId: Int? { get }
    var unitPriceBeforeTax: Double? { get }
    var lineItemId: String? { get }
    var discountReason: String? { get }
    var unitAdd: Double? { get }
    var parentSku: String { get }
}
