//
//  IListingResult.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IListingResult {
    var products: [IProduct] { get }
    var filters: [IFilter] { get }
}
