//
//  ICagegoryService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public typealias CategoryResponseHandler = (_ categories: [ICategory], _ isSuccess: Bool) -> ()

public enum CategoryZone: String {
    case topBrand = "top_brand"
    case topCategory = "top_category"
    case mobileCategory = "mobile-category"
    case newSeller = "new_seller_home"
    case customCategory = "custom_category"
}

public protocol ICagegoryService {
    func filter(page: Int, limit: Int, sort: [String], order: [String], level: Int, parentId: Int?, zone: CategoryZone?, handler: @escaping CategoryResponseHandler)
}

public extension ICagegoryService {
    func filter(page: Int, limit: Int, sort: [String], order: [String], level: Int, parentId: Int?, handler: @escaping CategoryResponseHandler) {
        filter(page: page, limit: limit, sort: sort, order: order, level: level, parentId: parentId, zone: nil, handler: handler)
    }
}
