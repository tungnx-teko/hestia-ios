//
//  Hestia.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/1/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreService
import UIKit

protocol HestiaInterface {
    func fetchApplicationList(completion: @escaping (Result<[HestiaApp], HestiaError>) -> ())
    func fetchApplicationManifest(appCode: String, completion: @escaping (Result<HestiaApp, HestiaError>) -> ())
    func startApp(appCode: String, delegate: HestiaDelegate?, onSuccess: @escaping () -> (), onFailure: @escaping (HestiaError) -> ())
}

public class Hestia {
    
    public static let shared = Hestia()
    public static let configName = "hestia"
    
    var application: HestiaApplication?
    var clientId: String?
    var delegates: [AppType: AppLauncherDelegate] = [:]

    var service: HestiaService?
    
    public func initialize(config: HestiaConfig, application: HestiaApplication) {
        self.application = application
        self.clientId = config.clientId
        self.service = HestiaService(url: URL(string: config.url)!)
        initDelegates()
    }
    
}

extension Hestia: HestiaInterface {
    
    public func fetchApplicationList(completion: @escaping (Result<[HestiaApp], HestiaError>) -> ()) {
        service?.fetchApplicationList(clientId: clientId ?? "", completion: { result in
            completion(result)
        })
    }
    
    public func fetchApplicationManifest(appCode: String, completion: @escaping (Result<HestiaApp, HestiaError>) -> ()) {
        service?.fetchApplicationManifest(clientId: clientId ?? "", appCode: appCode, completion: { result in
            completion(result)
        })
    }
    
    public func fetchAssetList(appCode: String, appVersion: String, assetIds: [String], completion: @escaping (Result<[AssetDetail], HestiaError>) -> ()) {
        service?.fetchAssetList(clientId: clientId ?? "", appCode: appCode, appVersion: appVersion, assetIds: assetIds, completion: { result in
            completion(result)
        })
    }

    public func startApp(appCode: String, delegate: HestiaDelegate? = nil,
                         onSuccess: @escaping () -> (),
                         onFailure: @escaping (HestiaError) -> ()) {
        guard let application = self.application else {
            onFailure(.applicationNotInit)
            return
        }
        service?.fetchApplicationManifest(clientId: clientId ?? "", appCode: appCode, completion: { result in
            switch result {
            case .success(let app):
                self.delegates[app.type]?.startApp(application: application, app: app, delegate: delegate, onSuccess: {
                    onSuccess()
                }, onFailure: { error in
                    onFailure(error)
                })
            case .failure(let error):
                onFailure(error)
            }
        })
    }
    
}

extension Hestia {
    
    func initDelegates() {
        let DelegateTypes = Runtime.allClasses().filter { $0 is AppLauncherDelegateFactory.Type }.compactMap { $0 as? AppLauncherDelegateFactory.Type }
        for DelegateType in DelegateTypes {
            let factory = DelegateType.init()

            if let needClientIdFactory = factory as? NeedClientId {
                if let clientId = self.clientId {
                    needClientIdFactory.withClientId(clientId: clientId)
                }
            }

            let delegate = factory.create()
            delegates[delegate.appType] = delegate
        }
    }
    
    
}
