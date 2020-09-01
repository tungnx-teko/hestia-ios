//
//  ICoreFlashSale.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol ICoreFlashSale {
    var channel: String? { get }
    var terminal: String? { get }
    var used: Int? { get }
    var total: Int? { get }
    var discountPercent: Double? { get }
}
