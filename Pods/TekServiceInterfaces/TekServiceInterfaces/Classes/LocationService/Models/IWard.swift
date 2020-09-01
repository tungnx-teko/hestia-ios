//
//  IWard.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol IWard: IAddress {
    var services: IShippingService? { get }
}
