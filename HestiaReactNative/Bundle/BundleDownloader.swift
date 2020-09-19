//
//  BundleDownloader.swift
//  HestiaReactNative
//
//  Created by batu on 9/16/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import Hestia
//import PromiseKit

class BundleDownloader {
    private let clientId: String
    
    init(clientId: String) {
        self.clientId = clientId
    }
    
    func resolveBundleFromManifest(app: HestiaApp, completion: @escaping (_ mainJsBundleUrl: URL?, _ error: Error?) -> ()) {
        let localApp = getCurrentLocalApp(for: app)
        
        if (shouldDownloadNewVersion(localApp, app)) {
            downloadNewVersion(localApp, app, completion)
        }
        
        completion(getMainBundleJsUrl(app.code, app.version), nil)
    }
    
    private func getCurrentLocalApp(for app: HestiaApp) -> LocalApp? {
        let userDefaults = UserDefaults.standard
        var localApp: LocalApp? = nil
        
        let currentAppKey = "@@-terra-rn-apps-\(app.code)-@@"
        let currentAppVersion = userDefaults.string(forKey: currentAppKey)
        
        guard currentAppVersion != nil else {
            return nil
        }

        let appDirectoryURL = FileManager.getDirectoryURL(of: app.code)
        let currentLocalAppManifestURL = appDirectoryURL.appendingPathComponent(app.version).appendingPathComponent("app.manifest", isDirectory: false)
        
        do {
            let data = try Data(contentsOf: currentLocalAppManifestURL)
            let decoder = JSONDecoder()
            localApp = try decoder.decode(LocalApp.self, from: data)
        } catch {
            // TODO: forward error to higher layer
        }

        return localApp
    }
    
    private func shouldDownloadNewVersion(_ localApp: LocalApp?, _ app: HestiaApp) -> Bool {
        return localApp == nil || localApp?.version != app.version
    }
    
    private func downloadNewVersion(_ localApp: LocalApp?, _ app: HestiaApp, _ completion: @escaping (_ mainJsBundleUrl: URL?, _ error: Error?) -> ()) {
        
        do {
            let (availableAssets, neededRemoteAssets) = checkNewAssetsWithLocal(localApp: localApp, app: app)
            let newLocalAppDirectoryUrl = getLocalAppDirectoryUrl(app.code, app.version)

            try copyAvailableAssets(availableLocalAssets: availableAssets)
            
            downloadNeededAssets(neededAssets: neededRemoteAssets, for: app, to: newLocalAppDirectoryUrl)
//            saveNewLocalAppToDb(app)
//            deleteLocalAppDirectory(localApp)
        } catch {
            // TODO
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

        let localAssets: [LocalAsset] = localApp!.assets
        let localAppDirectionUrl = getLocalAppDirectoryUrl(localApp!.code, localApp!.version)
        let newLocalAppDirectoryUrl = getLocalAppDirectoryUrl(app.code, app.version)

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
    ) throws {
        do {
            for availableAsset in availableLocalAssets {
                try FileManager.default.copyItem(at: availableAsset.sourceAssetUrl, to: availableAsset.destinationAssetUrl)
            }
        } catch {
            throw error
        }
    }
    
    private func downloadNeededAssets(
        neededAssets: [Asset],
        for app: HestiaApp,
        to newLocalAppDirectoryUrl: URL
    ) {
        let neededAssetIds = neededAssets.map { $0.id }
        
        Hestia.shared.fetchAssetList(appCode: app.code, appVersion: app.version, assetIds: neededAssetIds) { result  in
            switch result {
            case .success(let assets):
                print(assets)
            case .failure(let error):
                print(error)
            }
        }

//        if (result.isSuccess()) {
//            val gotAssets = result.get().data
//            gotAssets.map { asset ->
//                scope.async {
//                    downloadAsset(asset, newLocalAppDirectory)
//                }
//            }.awaitAll()
//        } else {
//            throw result.exception()
//        }
    }
    
    private func downloadAsset() {
        
    }
    
    private func getMainBundleJsUrl(_ appCode: String, _ appVersion: String) -> URL {
        return getLocalAppDirectoryUrl(appCode, appCode).appendingPathComponent("main.jsbundle", isDirectory: false)
    }
    
    private func getLocalAppDirectoryUrl(_ appCode: String, _ appVersion: String) -> URL {
        return FileManager.getDirectoryURL(of: appCode).appendingPathComponent(appVersion).appendingPathComponent("bundle")
   }
}
