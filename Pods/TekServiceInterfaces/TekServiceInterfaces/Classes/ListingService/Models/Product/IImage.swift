//
//  IImage.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/7/20.
//

import Foundation

public protocol IImage {
    var url: String? { get }
    var priority: Int? { get }
    var path: String? { get }
}
