//
//  IProductGroup.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IProductGroup {
    var id: Int? { get }
    var name: String? { get }
    var visible: String? { get }
    var configurations: [IConfiguration] { get }
    var variants: [IVariant] { get }
}
