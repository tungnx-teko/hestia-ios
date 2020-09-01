//
//  IOrderService.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public typealias OrderHandler = (_ order: IOrder?, _ isSuccess: Bool) -> ()
public typealias OrderListHandler = (_ order: [IOrderListItem]?, _ isSuccess: Bool) -> ()
public typealias CancelOrderHandler = (_ response: IOrderResponse?, _ success: Bool) -> ()

public protocol IOrderService {
    func getOrder(id: String, handler: @escaping OrderHandler)
    func queryOrder(id: String, handler: @escaping OrderHandler)
    func getOrderList(creatorId: String, orderCodes: [String], offset: Int, limit: Int, handler: @escaping OrderListHandler)
    func getMarketOrderList(creatorId: String, orderCodes: [String], offset: Int, limit: Int, handler: @escaping OrderListHandler)
    func cancelChildOrder(id: String, handler: @escaping CancelOrderHandler)
    func cancelMarketOrder(id: String, handler: @escaping CancelOrderHandler)
}
