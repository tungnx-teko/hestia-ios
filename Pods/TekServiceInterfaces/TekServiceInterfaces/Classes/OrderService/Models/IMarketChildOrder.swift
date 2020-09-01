//
//  IMarketChildOrder.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IMarketChildOrder {
    var id: String? { get }
    var code: String? { get }
    var grandTotal: Double { get }
}
