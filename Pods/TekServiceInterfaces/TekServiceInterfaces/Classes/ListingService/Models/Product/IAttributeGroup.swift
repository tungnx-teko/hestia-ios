//
//  IAttributeGroup.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IAttributeGroup {
    var id: Int? { get }
    var name: String? { get }
    var value: String? { get }
    var parentId: Int? { get }
}
