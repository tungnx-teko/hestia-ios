//
//  IBlockItem.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IBlockItem {
    var id: String? { get }
    var label: String? { get }
    var imageUrl: String? { get }
    var params: IBlockParams? { get }
    var url: String? { get }
}
