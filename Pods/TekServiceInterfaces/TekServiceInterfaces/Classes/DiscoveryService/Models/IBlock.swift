//
//  IBlock.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IBlock {
    var id: String? { get }
    var name: String? { get }
    var label: String? { get }
    var type: String? { get }
    var itemType: String? { get }
    var backgroundImageUrl: String? { get }
    var content: IBlockContent? { get }
}
