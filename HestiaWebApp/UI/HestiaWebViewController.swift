//
//  HestiaWebViewController.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/7/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import WebKit
import HestiaWebModule
import Hestia

open class HestiaWebViewController: UIViewController {
    
    let webView: WKWebView = {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        let source = "function captureLog(msg) { window.webkit.messageHandlers.logHandler.postMessage(msg); } window.console.log = captureLog;"
        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        webView.configuration.userContentController.addUserScript(script)
        
        return webView
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let manifest: WebAppManifest
    var delegate: HestiaDelegate?
    
    public init(manifest: WebAppManifest, delegate: HestiaDelegate?) {
        self.manifest = manifest
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        self.view.addSubview(webView)
        webView.frame = view.bounds
        loadApp(manifest: manifest)
        
        let leftMenuItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back))
        self.navigationItem.setLeftBarButton(leftMenuItem, animated: false)
        
        loadWebModules()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func back() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
        
    func loadApp(manifest: WebAppManifest) {
        guard let manifestData = manifest.data else { return }
        guard let url = URL(string: manifestData.url) else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func loadWebModules() {
        let factories = Runtime.allClasses().compactMap { $0 as? HestiaWebAppFactory.Type }
        factories.forEach {
            let factory = $0.init()
            factory.configure(webView: webView)
        }
    }
    
    
}
