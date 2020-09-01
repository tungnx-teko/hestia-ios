//
//  ICrmVat.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol ICrmVat {
    var vatName: String? { get }
    var vatAddress: String? { get }
    var taxCode: String? { get }
}
