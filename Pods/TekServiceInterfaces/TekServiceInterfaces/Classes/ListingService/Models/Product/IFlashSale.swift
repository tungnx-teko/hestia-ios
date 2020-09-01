//
//  IFlashSale.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IFlashSale: ICoreFlashSale {
    var definition: IDefinitionFlashSale? { get }
}
