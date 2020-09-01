//
//  IPriceRange.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IPriceRange {
    var minPrice: Double? { get }
    var maxPrice: Double? { get }
    
}
