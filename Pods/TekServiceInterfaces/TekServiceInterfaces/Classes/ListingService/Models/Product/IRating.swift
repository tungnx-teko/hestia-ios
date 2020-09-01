//
//  IRating.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IRating {
    var averagePoint: Double? { get }
    var voteCount: Int? { get }
}
