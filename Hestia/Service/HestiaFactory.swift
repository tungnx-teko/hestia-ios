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

public class HestiaFactory: ServiceBuildable, ServiceConfigAttachable {
    
    public var config: ServiceConfig?
    public var clientId: String?
    public var application: HestiaApplication!
    public var urlString: String?
    
    required public init() {
        
    }
    
    public static var sharedHestia: Hestia?
    
    public func createService() throws -> AnyService {
        guard let rawUrl = urlString, let url = URL(string: rawUrl) else {
            throw ServiceError.invalidURL
        }
        guard let application = application else {
            // FIXME: Invalid application
            throw ServiceError.invalidURL
        }
        guard let clientId = clientId else {
//            throw ServiceError.missingClientId
            // FIXME: Missing client id
            throw ServiceError.missingUserConfig
        }
        let instance = Hestia(application: application, url: url, clientId: clientId)
        HestiaFactory.sharedHestia = instance
        return AnyService(instance)
    }
    
    public func withConfig(_ config: ServiceConfig) {
        self.config = config
    }
    
    public func withApplication(_ application: HestiaApplication) {
        self.application = application
    }
    
}
