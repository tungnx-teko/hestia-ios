//
//  IOrderPayment.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderPayment {
    var amount: Double? { get }
    var paymentMethod: String? { get }
    var transactionId: String? { get }
}
