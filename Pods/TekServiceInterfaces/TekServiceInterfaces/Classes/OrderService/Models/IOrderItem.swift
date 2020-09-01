//
//  IOrderItem.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderItem {
    var sku: String? { get }
    var name: String? { get }
    var displayName: String? { get }
    var quantity: Int { get }
    var unitPrice: Double? { get }
    var price: Double? { get }
    var sellerId: Int? { get }
    var unitPriceBeforeTax: Double? { get }
    var rowTotal: Double? { get }
    var lineItemId: String? { get }
    var unitDiscount: Double? { get }
    var discountReason: String? { get }
    var unitAdd: Double? { get }
    var parentSku: String { get }
}
