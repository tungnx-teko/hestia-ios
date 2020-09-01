//
//  IOrderNotificationData.swift
//  TekStnServiceInterface
//
//  Created by linhvt on 8/3/20.
//

import Foundation

public protocol IOrderNotificationData {
    var orderId: String? { get }
    var orderState: Int? { get }
    var orderItems: String? { get }
}
