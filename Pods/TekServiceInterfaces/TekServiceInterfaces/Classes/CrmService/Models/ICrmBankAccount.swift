//
//  ICrmBankAccount.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol ICrmBankAccount {
    var bankCode: String? { get }
    var accNumber: String? { get }
    var accName: String? { get }
    var branchCode: String? { get }
}
