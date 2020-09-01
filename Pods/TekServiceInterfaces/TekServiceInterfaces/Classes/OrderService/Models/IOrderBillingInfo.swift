//
//  IBillingInfo.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderBillingInfo {
    var name: String? { get }
    var email: String? { get }
    var address: String? { get }
    var taxCode: String? { get }
    var type: String? { get }
    var phone: String? { get }
}
