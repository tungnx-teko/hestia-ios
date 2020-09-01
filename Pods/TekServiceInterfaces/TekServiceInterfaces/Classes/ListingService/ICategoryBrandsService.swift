//
//  ICategoryBrandsService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public typealias CategoryBrandResponseHandler = (_ brands: [ICategoryBrand], _ isSuccess: Bool) -> ()

public protocol ICategoryBrandsService {
    func getList(displayCategoryId: Int, sort: [String], handler: @escaping CategoryBrandResponseHandler)
    func getList(sellerCategories: [Int], handler: @escaping CategoryBrandResponseHandler)
}
