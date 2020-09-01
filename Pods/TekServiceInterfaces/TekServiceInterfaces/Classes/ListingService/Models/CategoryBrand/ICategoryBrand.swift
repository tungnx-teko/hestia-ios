//
//  ICategoryBrand.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public protocol ICategoryBrand {
    var id: Int { get }
    var name: String? { get }
    var codes: [String] { get }
    var thumbnailURL: String? { get }
    var configs: ICategoryBrandConfigs? { get }
}
