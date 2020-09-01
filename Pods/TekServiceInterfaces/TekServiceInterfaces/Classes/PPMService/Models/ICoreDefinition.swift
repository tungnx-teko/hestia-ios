//
//  ICoreDefinition.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol ICoreDefinition {
    var id : Int { get }
    var startedAt : String? { get }
    var endedAt : String? { get }
    var name : String { get }
    var description : String? { get }
    var timeRanges : [ITimeRange] { get }
    var paymentMethods : [String] { get }
}
