//
//  IVariantImage.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IVariantImage {
    var url: String? { get }
    var path: String? { get }
    var priority: Int? { get }
}
