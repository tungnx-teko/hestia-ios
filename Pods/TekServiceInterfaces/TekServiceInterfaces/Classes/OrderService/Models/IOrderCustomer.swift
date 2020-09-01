//
//  IOrderCustomer.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderCustomer {
    var id: Int? { get }
    var name: String? { get }
    var phone: String? { get }
    var address: String? { get }
    var fullAddress: String? { get }
    var email: String? { get }
    var asiaCrmId: String? { get }
    var wardId: String? { get }
    var districtId: String? { get }
    var provinceId: String? { get }
}
