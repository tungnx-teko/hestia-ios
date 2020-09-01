//
//  IAttributeValue.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IAttributeValue {
    var code: String? { get }
    var value: String? { get }
    var id: Int? { get }
    var optionId: Int? { get }
}
