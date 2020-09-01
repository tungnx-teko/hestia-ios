//
//  ISeoInfo.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol ISeoInfo {
    var metaKeyword: String? { get }
    var metaTitle: String? { get }
    var metaDescription: String? { get }
    var shortDescription: String? { get }
    var description: String? { get }
}
