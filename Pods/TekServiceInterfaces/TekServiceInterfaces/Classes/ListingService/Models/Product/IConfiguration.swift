//
//  IConfiguration.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IConfiguration {
    var code: String? { get }
    var name: String? { get }
    var id: Int? { get }
    var optionType: String? { get }
    var options: [IOption] { get }
}
