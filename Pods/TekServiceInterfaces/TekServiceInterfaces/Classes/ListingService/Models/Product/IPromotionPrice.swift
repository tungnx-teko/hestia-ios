//
//  IPromotionPrice.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IPromotionPrice {
    var channel: String? { get }
    var terminal: String? { get }
    var finalPrice: Double? { get }
    var promotionPrice: Double? { get }
    var flashSalePrice: Double? { get }
}
