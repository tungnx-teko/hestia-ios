//
//  IPPMService.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public typealias ValidateCouponHandler = (IDefinition?, Bool, String?) -> ()

public protocol IPpmService {
    func getOrderPromotions(completion: @escaping ([IDefinition], Bool) -> ())
    func validateCoupon(coupon: String, skus: [String], grandTotal: Double, completion: @escaping ValidateCouponHandler)
}
