//
//  HestiaFactory.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreService
import UIKit

//public class HestiaFactory: ServiceBuildable, ServiceConverterSupportable {
//    
//    public typealias ServiceConverter = HestiaConfigConverter
//    
//    public var rawConfig: [String : Any] = [:]
//    public var serviceName: String = "hestia"
//    
//    public var clientId: String?
//    public var application: HestiaApplication!
//    public var urlString: String?
//    
//    required public init() {}
//    
//    public func createService() throws -> AnyService {
//        guard let config = config, let url = URL(string: config.url) else {
//            throw ServiceError.invalidURL
//        }
//        let instance = Hestia(application: application, url: url, clientId: config.clientId)
//        return AnyService(instance)
//    }
//    
//    public func withApplication(_ application: HestiaApplication) {
//        self.application = application
//    }
//    
//}
