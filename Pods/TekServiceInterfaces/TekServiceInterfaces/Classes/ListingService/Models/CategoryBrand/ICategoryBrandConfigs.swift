//
//  ICategoryBrandConfigs.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public protocol ICategoryBrandConfigs {
    var brands: [String] { get }
    var sellerCategories: [Int] { get }
    var sellerIds: [Int] { get }
    var skus: [String] { get }
}
