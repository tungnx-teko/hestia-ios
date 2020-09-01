//
//  IBannerResult.swift
//  TekPageBuilderServiceInterface
//
//  Created by linhvt on 8/4/20.
//

import Foundation

public protocol IBannerResult {
    var currentPage: Int { get }
    var pageSize: Int { get }
    var totalItems: Int { get }
    var banners: [IBanner] { get }
}
