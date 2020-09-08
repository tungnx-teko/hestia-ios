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
    func startApp(appCode: String, delegate: HestiaDelegate?) throws
}

public class Hestia: BaseService<APIManager> {
    
    var application: HestiaApplication
    var clientId: String
    var delegates: [AppType: AppLauncherDelegate] = [:]
    
    var encodedClientId: String {
        return clientId.toBase64()
    }
    
    public init(application: HestiaApplication, url: URL, clientId: String) {
        self.application = application
        self.clientId = clientId
        super.init(url: url)
        initDelegates()
    }
    
}

extension Hestia: HestiaInterface {
    
    func fetchApplicationList(completion: @escaping (Result<[HestiaApp], HestiaError>) -> ()) {
        let request = HestiaListRequest(clientId: encodedClientId)
        apiManager.call(request, onSuccess: { response in
            completion(.success(response.data))
        }) { (error, response) in
            completion(.failure(.unexpected))
        }
    }
    
    func fetchApplicationManifest(appCode: String, completion: @escaping (Result<HestiaApp, HestiaError>) -> ()) {
        let request = HestiaGetRequest(clientId: encodedClientId, appCode: appCode)
        apiManager.call(request, onSuccess: { response in
            guard let app = response.data else {
                completion(.failure(.appNotFound))
                return
            }
            completion(.success(app))
        }) { (error, _) in
            print(error)
            completion(.failure(HestiaError.unexpected))
        }
    }
    
    func startApp(appCode: String, delegate: HestiaDelegate? = nil) throws {
        // FIXME: Remove this
        let app = mockApps.first { $0.code == appCode }!
        try? self.delegates[app.type]?.startApp(application: self.application, app: app, delegate: delegate)
        
//        fetchApplicationManifest(appCode: appCode) { result in
//            switch result {
//            case .success(let app):
//                try? self.delegates[app.type]?.startApp(application: self.application, app: app, delegate: delegate)
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
}

extension Hestia {
    
    func initDelegates() {
        let DelegateTypes = Runtime.allClasses().filter { $0 is AppLauncherDelegateFactory.Type }.compactMap { $0 as? AppLauncherDelegateFactory.Type }
        for DelegateType in DelegateTypes {
            let factory = DelegateType.init()
            let delegate = factory.create()
            delegates[delegate.appType] = delegate
        }
    }
    
    
}