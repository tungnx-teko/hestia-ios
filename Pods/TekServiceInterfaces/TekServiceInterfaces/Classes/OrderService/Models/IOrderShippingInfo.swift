//
//  IShippingInfo.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderShippingInfo {
    var name: String { get }
    var phone: String { get }
    var email: String? { get }
    var expectedDate: String? { get }
    var provinceId: String { get }
    var wardId: String { get }
    var districtId: String { get }
    var address: String { get }
    var fullAddress: String { get }
    var country: String { get }
    var type: Int? { get }
    var note: String? { get }
    var lat: Double? { get }
    var lon: Double? { get }
    var storeCode: String? { get }
}
