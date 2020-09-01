//
//  IBenefit.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol IBenefit {
    var money: [IMoney] { get }
    var items: [IItem] { get }
    var voucher: IVoucher? { get }
}
