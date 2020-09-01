//
//  IAvailableByStoreObject.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IAvailableByStoreObject {
    var code: String? { get }
    var total: Int { get }
}
