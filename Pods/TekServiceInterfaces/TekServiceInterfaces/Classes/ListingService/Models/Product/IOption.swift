//
//  IOption.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IOption {
    var optionId: Int? { get }
    var value: String? { get }
    var image: IVariantImage? { get }
    var selected: Bool { get }
    var enabled: Bool { get }
}
