//
//  IStock.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IStock {
    var branch: String? { get }
    var branchName: String? { get }
    var warehouse: String? { get }
    var warehouseName: String? { get }
    var location: String? { get }
    var locationName: String? { get }
    var storeCode: String? { get }
    var productBizType: String? { get }
    var available: Int? { get }
    var onHand: Int? { get }
    var reserved: Int? { get }
    var timestamp: Double? { get }
}
