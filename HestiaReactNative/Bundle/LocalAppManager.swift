//
//  LocalAppManager.swift
//  HestiaReactNative
//
//  Created by batu on 9/23/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Hestia

protocol LocalAppManager {
    func getCurrentLocalApp(for app: HestiaApp) -> LocalApp?
    
    func saveNewLocalApp(for app: HestiaApp) throws

    func getMainBundleJsUrl(_ appCode: String, _ appVersion: String) -> URL
    
    func getLocalAppBundleUrl(_ appCode: String, _ appVersion: String) -> URL
    
    func getLocalAppDirectoryUrl(_ appCode: String, _ appVersion: String) -> URL
}

class LocalAppManagerImpl: LocalAppManager {
    private let userDefaults = UserDefaults.standard

    func getCurrentLocalApp(for app: HestiaApp) -> LocalApp? {
        var localApp: LocalApp? = nil
        
        let currentAppKey = getLocalAppKey(appCode: app.code)
        let currentAppVersion = userDefaults.string(forKey: currentAppKey)

        guard currentAppVersion != nil else {
            return nil
        }

        let appDirectoryURL = FileManager.getDirectoryURL(of: app.code)
        let currentLocalAppManifestURL = appDirectoryURL
                .appendingPathComponent(app.version)
                .appendingPathComponent(LocalAppConfig.manifestFilename, isDirectory: false)
        
        do {
            let data = try Data(contentsOf: currentLocalAppManifestURL)
            let decoder = JSONDecoder()
            localApp = try decoder.decode(LocalApp.self, from: data)
        } catch {
        }

        return localApp
    }
    
    func saveNewLocalApp(for app: HestiaApp) throws {
        let appAssets = (app.manifest?.base as? ReactNativeAppManifest)?.data?.assets ?? []
        let newLocalApp = LocalApp(
            code: app.code,
            version: app.version,
            assets: appAssets
        )
        let localAppManifestUrl = getLocalAppManifestUrl(app.code, app.version)
        
        let currentAppKey = getLocalAppKey(appCode: app.code)
        userDefaults.set(app.version, forKey: currentAppKey)

        try FileUtils.save(jsonObject: newLocalApp, to: localAppManifestUrl)
    }
    
    func getMainBundleJsUrl(_ appCode: String, _ appVersion: String) -> URL {
        return getLocalAppBundleUrl(appCode, appVersion).appendingPathComponent(LocalAppConfig.mainJsBundleFilename, isDirectory: false)
    }
    
    func getLocalAppManifestUrl(_ appCode: String, _ appVersion: String) -> URL {
        return getLocalAppDirectoryUrl(appCode, appVersion).appendingPathComponent(LocalAppConfig.manifestFilename, isDirectory: false)
    }
    
    func getLocalAppBundleUrl(_ appCode: String, _ appVersion: String) -> URL {
        return getLocalAppDirectoryUrl(appCode, appVersion).appendingPathComponent(LocalAppConfig.bundleDirectoryName)
    }
    
    func getLocalAppDirectoryUrl(_ appCode: String, _ appVersion: String) -> URL {
        return FileManager.getDirectoryURL(of: appCode).appendingPathComponent(appVersion)
    }
    
    private func getLocalAppKey(appCode: String) -> String {
        return "@@-rn-apps-\(appCode)-@@"
    }
    
}
