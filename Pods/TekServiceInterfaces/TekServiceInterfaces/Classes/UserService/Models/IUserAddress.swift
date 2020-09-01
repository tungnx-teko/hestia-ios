//
//  IUserAddress.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/11/20.
//

import Foundation

public protocol IUserAddress {
    var address: String { get }
    var addressNote: String? { get }
    var clientCode: String? { get }
    var districtCode: String? { get }
    var districtName: String? { get }
    var email: String? { get }
    var id: String? { get }
    var isDefault: Bool { get }
    var latitude: String? { get }
    var longitude: String? { get }
    var name: String { get }
    var provinceCode: String? { get }
    var provinceName: String? { get }
    var telephone: String { get }
    var userId: String? { get }
    var wardCode: String? { get }
    var wardName: String? { get }
    
    var payloadDict: [String: Any] { get }
}
