//
//  IFilterValue.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IFilterValue {
    var count: Int? { get }
    var option: String? { get }
    var value: String? { get }
}
