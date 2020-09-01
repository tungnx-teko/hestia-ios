//
//  DiscoveryService.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/6/20.
//

import Foundation

public typealias BlockResponseHandler = (_ result: IBlockResult?, _ isSuccess: Bool) -> ()

public protocol IDiscoveryService {
    func blocks(userId: String?, phone: String?, completion: @escaping BlockResponseHandler)
}
