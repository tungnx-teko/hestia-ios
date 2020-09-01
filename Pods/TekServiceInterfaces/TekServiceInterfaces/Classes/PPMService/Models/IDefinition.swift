//
//  IDefinition.swift
//  PPMServiceInterface
//
//  Created by Tung Nguyen on 8/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public protocol IDefinition: ICoreDefinition {
    var benefit: IBenefit? { get }
    var condition: ICondition? { get }
    var channel: String { get }
    var applyOn: String? { get }
    var sellerId: Int? { get }
    var channels: [String] { get }
    var type: String { get }
}
