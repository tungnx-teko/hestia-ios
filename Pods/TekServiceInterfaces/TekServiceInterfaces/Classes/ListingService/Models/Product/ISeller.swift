//
//  ISeller.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol ISeller {
    var id: Int? { get }
    var name: String? { get }
    var displayName: String? { get }
}
