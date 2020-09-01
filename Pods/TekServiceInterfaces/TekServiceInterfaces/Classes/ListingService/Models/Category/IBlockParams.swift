//
//  IBlockParams.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IBlockParams {
    var filter: IBlockFilter? { get }
    var sorting: IBlockSorting? { get }
}
