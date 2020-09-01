//
//  IOrderResponse.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/13/20.
//

import Foundation

public protocol IOrderResponse {
    var statusCode: Int? { get }
    var error: IOrderError? { get }
}
