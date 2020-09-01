//
//  IShippingService.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol IShippingService {
    var supportFastDelivery: Bool { get }
    var supportInstall: Bool { get }
}
