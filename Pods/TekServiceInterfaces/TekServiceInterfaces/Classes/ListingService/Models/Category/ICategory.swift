//
//  ICategory.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol ICategory {
    var id: Int? { get }
    var code: String? { get }
    var name: String? { get }
    var icon: String? { get }
    var configs: [String: Any] { get }
    var level: Int? { get }
    var parentId: Int? { get }
    var sellerCategories: [Int] { get }
    var urlType: String? { get }
    var targetPath: String? { get }
    var url: String? { get }
    var blockParams: IBlockParams? { get }
}
