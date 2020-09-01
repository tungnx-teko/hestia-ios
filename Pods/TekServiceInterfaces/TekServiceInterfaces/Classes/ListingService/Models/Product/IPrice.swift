//
//  IPrice.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IPrice {
    var supplierSalePrice: Double? { get }
    var sellPrice: Double? { get }
}
