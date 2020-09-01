//
//  IPromotion.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IPromotion {
    var channel: String? { get }
    var terminal: String? { get }
    var definitions: [IDefinition]? { get }
}
