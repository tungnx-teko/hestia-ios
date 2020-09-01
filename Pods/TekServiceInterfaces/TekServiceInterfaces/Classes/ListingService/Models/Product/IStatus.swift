//
//  IStatus.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IStatus {
    var publish: Bool? { get }
    var sale: String? { get }
    var needManageStock: Bool? { get }
}
