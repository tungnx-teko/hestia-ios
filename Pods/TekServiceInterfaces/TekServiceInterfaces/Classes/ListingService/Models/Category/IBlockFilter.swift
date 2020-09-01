//
//  IBlockFilter.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IBlockFilter {
    var attributes: [IBlockAttribute] { get }
    var brands: [String] { get }
    var categories: [String] { get }
    var hasPromotions: Bool? { get }
    var location: String? { get }
    var providerIds: [String] { get }
    var priceGte: Int? { get }
    var priceLte: Int? { get }
    var sellerIds: [String] { get }
    var sellingCodes: [String] { get }
    var skus: [String] { get }
    var tags: [String] { get }
    var terminalCode: String? { get }
    var flashSaleType: String? { get }
}
