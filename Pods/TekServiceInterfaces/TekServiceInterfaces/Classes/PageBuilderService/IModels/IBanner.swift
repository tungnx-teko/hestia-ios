//
//  Banner.swift
//  TekPageBuilderServiceInterface
//
//  Created by linhvt on 8/4/20.
//

import Foundation

public protocol IBanner {
    var image: String? { get }
    var priority: Int { get }
    var campaignName: String? { get }
    var startDate: Date? { get }
    var endDate: Date? { get }
}
