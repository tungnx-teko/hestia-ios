//
//  IBlockAttribute.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IBlockAttribute {
    var code: String? { get }
    var values: [String] { get }
}
