//
//  IRecommendationService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public protocol IRecommendationService {
    func getRecommendProductsForUser(page: Int, handler: @escaping ProductsListDetailResponseHandler)
    func getRecommendProductsForUserByCategory(page: Int, sellerCategories: [Int], handler: @escaping ProductsListDetailResponseHandler)
    func getRecommendProductsBySku(_ sku: String, page: Int, handler: @escaping ProductsListDetailResponseHandler)
}
