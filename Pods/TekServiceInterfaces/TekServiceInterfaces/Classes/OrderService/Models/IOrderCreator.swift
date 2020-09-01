//
//  IOrderCreator.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public protocol IOrderCreator {
    var id: String? { get }
    var name: String? { get }
    var email: String? { get }
    var phone: String? { get }
    var asiaUserName: String? { get }
}
