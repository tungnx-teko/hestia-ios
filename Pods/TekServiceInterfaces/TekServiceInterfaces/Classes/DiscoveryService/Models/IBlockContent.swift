//
//  IBlockContent.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IBlockContent {
    var items: [IBlockItem] { get }
    var fetchParams: IBlockParams? { get }
}
