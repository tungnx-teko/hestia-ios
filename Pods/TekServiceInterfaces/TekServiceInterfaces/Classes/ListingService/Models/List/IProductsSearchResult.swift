//
//  IProductsSearchResult.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public protocol IProductsSearchResult {
    var result: IListingResult? { get }
    var extra: IExtra? { get }
}
