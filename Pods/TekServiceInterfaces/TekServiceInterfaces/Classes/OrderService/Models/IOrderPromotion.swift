//
//  IOrderPromotion.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderPromotion {
    var id: Int? { get }
    var promotionId: String? { get }
    var originalDiscount: Double { get }
    var discount: Double { get }
    var gifts: [IOrderGift] { get }
    var quantity: Int { get }
    var voucher: IOrderVoucher? { get }
    var vouchers: [String] { get }
    var coupon: String? { get }
    var applyOn: [IOrderPromotionApply] { get }
    var applyType: String? { get }
    var type: String? { get }
    var sellerId: Int? { get }
}
