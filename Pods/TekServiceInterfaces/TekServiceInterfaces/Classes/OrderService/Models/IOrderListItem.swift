//
//  IOrderListItem.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderListItem {
    var billingInfo: IOrderBillingInfo? { get }
    var cancellationReason: String? { get }
    var cancelledAt: String? { get }
    var cancelledBy: IOrderStaff? { get }
    var cancelledType: Int? { get }
    var childOrders: [IMarketChildOrder] { get }
    var code: String? { get }
    var confirmAt: String? { get }
    var confirmer: IOrderStaff? { get }
    var createdAt: String? { get }
    var creator: IOrderCreator? { get }
    var customer: IOrderCustomer? { get }
    var grandTotal: Double { get }
    var id: String { get }
    var inventoryCode: String? { get }
    var isCancellable: Bool { get }
    var isPaid: Bool { get }
    var items: [IOrderItem] { get }
    var memberCard: String? { get }
    var note: String? { get }
    var notes: [Int: String]? { get }
    var originalId: String? { get }
    var paymentConfirmer: IOrderStaff? { get }
    var payments: [IOrderPayment] { get }
    var predictCancelTime: String? { get }
    var promotions: [IOrderPromotion] { get }
    var referralCode: String? { get }
    var refOrderCode: String? { get }
    var salesmanId: String? { get }
    var seller: ISeller? { get }
    var sellerId: Int? { get }
    var service: IOrderExtraService? { get }
    var shippingInfo: IOrderShippingInfo? { get }
    var state: Int? { get }
    var tax: Double { get }
    var terminalCode: String? { get }
    var totalDiscount: Double { get }
    var version: Int? { get }
}
