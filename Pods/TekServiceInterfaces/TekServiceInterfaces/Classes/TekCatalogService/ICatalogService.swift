//
//  ICatalogService.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/11/20.
//

import Foundation

public protocol ICatalogService {
    func getSellerList(completion: @escaping ([ICatalogSeller]) -> ())
}
