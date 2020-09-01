//
//  IVariant.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IVariant {
    var sku : String? { get }
    var attributeValues : [IAttributeValue] { get }
}
