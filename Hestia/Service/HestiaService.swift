//
//  HestiaService.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import TekCoreService

class HestiaService: BaseService<APIManager> {
    
    public func fetchApplicationList(clientId: String, completion: @escaping (Result<[HestiaApp], HestiaError>) -> ()) {
        let request = HestiaListRequest(clientId: clientId.toBase64())
        apiManager.call(request, onSuccess: { response in
            completion(.success(response.data))
        }) { (error, response) in
            completion(.failure(.unexpected))
        }
    }
    
    public func fetchApplicationManifest(clientId: String, appCode: String, completion: @escaping (Result<HestiaApp, HestiaError>) -> ()) {
        let request = HestiaGetRequest(clientId: clientId.toBase64(), appCode: appCode)
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

    public func fetchAssetList(clientId: String, appCode: String, appVersion: String, assetIds: [String], completion: @escaping (Result<[AssetDetail], HestiaError>) -> ()) {
        let request = AssetListRequest(clientId: clientId.toBase64(), appCode: appCode, appVersion: appVersion, assetIds: assetIds)
        apiManager.call(request, onSuccess: { response in
            completion(.success(response.data))
        }) { (error, _) in
            completion(.failure(.unexpected))
        }
    }
    
}
