//
//  ICrmResponseMessage.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/10/20.
//

import Foundation

public protocol ICrmResponseMessage {
    var name: [String] { get }
    var contacts: [String: ICrmResponseMessage] { get }
}
