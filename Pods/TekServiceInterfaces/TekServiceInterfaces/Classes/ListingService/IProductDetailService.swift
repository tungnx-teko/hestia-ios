//
//  IProductDetailService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public typealias ProductsListDetailResponseHandler = (_ result: IListingResult?, _ isSuccess: Bool) -> ()
public typealias ProductDetailResponseHandler = (_ result: IProduct?, _ isSuccess: Bool) -> ()

public protocol IProductDetailService {
    func getProductDetail(sku: String, storeCodes: [String], handler: @escaping ProductDetailResponseHandler)
    func getProductsListDetail(skus: [String], storeCodes: [String], isInteralProducts: Bool, handler: @escaping ProductsListDetailResponseHandler)
}
