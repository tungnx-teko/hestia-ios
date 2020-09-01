//
//  IUserInfo.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/11/20.
//

import Foundation

public protocol IUserInfo {
    var userId: String? { get }
    var name: String? { get }
    var picture: String? { get }
    var dob: String? { get }
    var email: String? { get }
    var telephone: String? { get }
    var sex: String? { get }
    
    var payloadDict: [String: Any] { get }
}
