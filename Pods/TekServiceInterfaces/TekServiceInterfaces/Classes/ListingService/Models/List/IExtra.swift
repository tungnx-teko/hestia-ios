//
//  IExtra.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IExtra {
    var totalItems: Int? { get }
    var page: Int? { get }
    var pageSize: Int? { get }
    var priceRanges: [IPriceRange] { get }

}
