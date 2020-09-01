//
//  IOrder.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrder {
    var orderListItem: IOrderListItem { get }
    var latestUpdateTime: String? { get }
}
