//
//  ICrmContact.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol ICrmContact {
    var address: String? { get }
    var comment: String? { get }
    var contactRelation: String { get }
    var district: String { get }
    var email: String { get }
    var facebookLink: String { get }
    var fax: String { get }
    var gender: String { get }
    var id: Int { get }
    var isDefault: Bool { get }
    var name: String? { get }
    var phone: String { get }
    var province: String { get }
    var updatedAt: String? { get }
    var ward: String { get }
    var payloadDict: [String: Any]? { get }
}
