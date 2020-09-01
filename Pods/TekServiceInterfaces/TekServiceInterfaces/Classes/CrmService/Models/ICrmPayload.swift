//
//  ICrmPayload.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/10/20.
//

import Foundation

public protocol ICrmPayload {
    var name: String? { get }
    var phone: String? { get }
    var province: String? { get }
    var district: String? { get }
    var ward: String? { get }
    var contacts: [ICrmContact] { get }
    var payloadDict: [String: Any]? { get }
}
