//
//  ICrmError.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/10/20.
//

import Foundation

public protocol ICrmError {
    var code: Int? { get }
    var error: Bool? { get }
    var customers: [ICrmCustomer] { get }
    var message: ICrmResponseMessage? { get }
}
