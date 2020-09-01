//
//  IKeyword.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/5/20.
//

import Foundation

public protocol IKeyword {
    var query: String { get }
    var highlight: String? { get }
    var brands: [String] { get }
    var category: IKeywordCategory? { get }
    var providerId: Int? { get }
    var sellerCategories: [Int] { get }
}
