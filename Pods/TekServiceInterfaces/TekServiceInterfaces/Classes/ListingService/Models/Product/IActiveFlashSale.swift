//
//  IActiveFlashSale.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IActiveFlashSale: ICoreFlashSale {
    var name: String? { get }
    var type: IType? { get }
    var flashSalePrice: String? { get }
    var status: String? { get }
    var timeRanges: [ITimeRange] { get }
}
