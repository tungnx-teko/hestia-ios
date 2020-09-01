//
//  ICatalogSeller.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/11/20.
//

import Foundation

public protocol ICatalogSeller {
    var id: Int { get }
    var displayName: String? { get }
    var enterpriseCode: String? { get }
    var code: String? { get }
    var address: String? { get }
    var englishName: String? { get }
    var contractNo: String? { get }
    var name: String? { get }
    var taxNumber: String? { get }
    var status: Int { get }
}
