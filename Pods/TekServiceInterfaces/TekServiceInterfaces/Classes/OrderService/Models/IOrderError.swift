//
//  IOrderError.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/13/20.
//

import Foundation

public protocol IOrderError {
    var detail: String { get }
    var message: String { get }
}
