//
//  IProvider.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IProvider {
    var id: Int? { get }
    var name: String? { get }
    var slogan: String? { get }
    var logo: String? { get }
}
