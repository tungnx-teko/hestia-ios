//
//  IAppliedPromotion.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol IAppliedPromotion {
    var id: Int { get }
    var name: String { get }
    var description: String { get }
    var benefit: IBenefit? { get }
}
