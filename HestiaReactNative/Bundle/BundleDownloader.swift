//
//  BundleDownloader.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import Hestia
import PromiseKit
import Alamofire

class BundleDownloader {
    private let clientId: String
    private let localAppManager: LocalAppManager
    
    init(clientId: String, localAppManager: LocalAppManager) {
        self.clientId = clientId
        self.localAppManager = localAppManager
    }
    
    func resolveBundleFromManifest(app: HestiaApp, completion: @escaping (_ mainJsBundleUrl: URL?, _ error: Error?) -> ()) {
        let localApp = localAppManager.getCurrentLocalApp(for: app)
        
        if (shouldDownloadNewVersion(localApp, app)) {
            downloadNewVersion(localApp, app, completion)
        } else  {
            completion(localAppManager.getMainBundleJsUrl(app.code, app.version), nil)
        }
    }
    
    private func shouldDownloadNewVersion(_ localApp: LocalApp?, _ app: HestiaApp) -> Bool {
        return localApp == nil || localApp?.version != app.version
    }
    
    private func downloadNewVersion(_ localApp: LocalApp?, _ app: HestiaApp, _ completion: @escaping (_ mainJsBundleUrl: URL?, _ error: Error?) -> ()) {
        
        let (availableAssets, neededRemoteAssets) = checkNewAssetsWithLocal(localApp: localApp, app: app)
        let newLocalAppDirectoryUrl = localAppManager.getLocalAppDirectoryUrl(app.code, app.version)

        firstly {
            copyAvailableAssets(availableLocalAssets: availableAssets)
        }.then { (result: Void) -> Promise<Void> in
            self.downloadNeededAssets(neededAssets: neededRemoteAssets, for: app, to: newLocalAppDirectoryUrl)
        }.then { (result: Void) -> Promise<Void> in
            self.saveNewLocalAppManifest(app: app)
        }.then { (result: Void) -> Promise<Void> in
            self.deleteLocalAppDirectory(localApp: localApp)
        }.done {
            completion(self.localAppManager.getMainBundleJsUrl(app.code, app.version), nil)
        }.catch { error in
            completion(nil, error)
        }
        
    }
    
    private func checkNewAssetsWithLocal(
        localApp: LocalApp?,
        app: HestiaApp
    ) -> ([AvailableAsset], [Asset]) {
        let appAssets = (app.manifest?.base as? ReactNativeAppManifest)?.data?.assets ?? []
        guard localApp != nil else {
            return ([], appAssets)
        }

        let localAssets: [Asset] = localApp!.assets
        let localAppDirectionUrl = localAppManager.getLocalAppDirectoryUrl(localApp!.code, localApp!.version)
        let newLocalAppDirectoryUrl = localAppManager.getLocalAppDirectoryUrl(app.code, app.version)

        var availableAssets = [AvailableAsset]()
        var neededAssets = [Asset]()
        
        for newAsset in appAssets {
            let foundLocalAsset = localAssets.first { $0.checksum == newAsset.checksum }
            if let foundLocalAsset = foundLocalAsset {
                availableAssets.append(
                    AvailableAsset(
                        sourceAssetUrl: localAppDirectionUrl.appendingPathComponent(foundLocalAsset.name, isDirectory: false),
                        destinationAssetUrl: newLocalAppDirectoryUrl.appendingPathComponent(newAsset.name, isDirectory: false)
                    )
                )
            } else {
                neededAssets.append(newAsset)
            }
        }

        return (availableAssets, neededAssets)
    }
    
    private func copyAvailableAssets(
        availableLocalAssets: [AvailableAsset]
    ) -> Promise<Void> {
        return Promise { seal in
            do {
                for availableAsset in availableLocalAssets {
                    try FileManager.default.copyItem(at: availableAsset.sourceAssetUrl, to: availableAsset.destinationAssetUrl)
                }
                seal.fulfill(())
            } catch {
                seal.reject(error)
            }
        }
    }
    
    private func downloadNeededAssets(
        neededAssets: [Asset],
        for app: HestiaApp,
        to newLocalAppDirectoryUrl: URL
    ) -> Promise<Void> {
        return Promise { seal in
            let neededAssetIds = neededAssets.map { $0.id }
            let localAppBundleUrl = newLocalAppDirectoryUrl.appendingPathComponent("bundle")

            firstly {
                fetchAssetList(app.code, app.version, neededAssetIds)
            }.then { (assets: [AssetDetail]) -> Promise<[URL]> in
                let downloadAssetPromises = assets.map { self.downloadAsset($0, to: localAppBundleUrl) }
                return when(fulfilled: downloadAssetPromises)
            }.done { result in
                return seal.fulfill(())
            }.catch { error in
                return seal.reject(error)
            }
        }
    }

    private func fetchAssetList(_ appCode: String, _ appVersion: String, _ assetIds: [String]) -> Promise<[AssetDetail]> {
        return Promise { seal in
            Hestia.shared.fetchAssetList(appCode: appCode, appVersion: appVersion, assetIds: assetIds) { result  in
                switch result {
                case .success(let assets):
                    seal.fulfill(assets)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
    
    private func downloadAsset(_ asset: AssetDetail, to directoryDestination: URL) -> Promise<URL> {
        return Promise { seal in
            Alamofire.request(asset.content).responseData { response in
                guard let data = response.value else {
                    seal.reject(response.error!)
                    return
                }
                guard let decodedData = Data(base64Encoded: data) else {
                    seal.reject(HestiaError.invalidAssetFormat)
                    return
                }
                
                do {
                    let assetFileUrl = directoryDestination.appendingPathComponent(asset.name, isDirectory: false)
                    try FileUtils.createFileIfNotExists(file: assetFileUrl)
                    try decodedData.write(to: assetFileUrl)
                    seal.fulfill(assetFileUrl)
                } catch {
                    seal.reject(error)
                }
            }
        }
    }
    
    private func saveNewLocalAppManifest(app: HestiaApp) -> Promise<Void> {
        return Promise { seal in
            do {
                try localAppManager.saveNewLocalApp(for: app)
                seal.fulfill(())
            } catch {
                seal.reject(error)
            }
        }
    }
    
    private func deleteLocalAppDirectory(localApp: LocalApp?) -> Promise<Void> {
        return Promise { seal in
            do {
                if let localApp = localApp {
                    try FileUtils.removeItemIfExists(atPath: localAppManager.getLocalAppDirectoryUrl(localApp.code, localApp.version))
                }
                seal.fulfill(())
            } catch {
                seal.reject(error)
            }
        }
    }
}
