//
//  LoadingViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

class LoadingViewController : UIViewController {
    
    private let errorView = UIView()
    private let loadingView = UIView()
    
    private let bundleDownloader: BundleDownloader
    private let app: HestiaApp
    
    init(clientId: String, app: HestiaApp) {
        self.bundleDownloader = BundleDownloader(clientId: clientId, localAppManager: LocalAppManagerImpl())
        self.app = app
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLoading()
        setupErrorView()
        
        loadAppBundle()
    }
    
    private func setupLoading() {
        loadingView.frame = view.frame
        loadingView.backgroundColor = .white
        view.addSubview(loadingView)
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingView.addSubview(loadingIndicator)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.startAnimating();
    }
    
    private func setupErrorView() {
        errorView.frame = view.frame
        errorView.backgroundColor = .white
        view.addSubview(errorView)
        
        let errorLabel = UILabel()
        errorView.addSubview(errorLabel)
        errorLabel.text = "Something went wrong. Please try again!"
        errorLabel.textAlignment = .center
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.numberOfLines = 0
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.leadingAnchor.constraint(equalTo: errorView.leadingAnchor, constant: 24).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: errorView.trailingAnchor, constant: -24).isActive = true
        errorLabel.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 200).isActive = true
        
        let retryButton = UIButton(type: .system)
        retryButton.setTitle("Retry", for: .normal)
        errorView.addSubview(retryButton)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.centerXAnchor.constraint(equalTo: errorView.centerXAnchor).isActive = true
        retryButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 24).isActive = true
        retryButton.addTarget(self, action: #selector(self.retry(sender:)), for: .touchUpInside)
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        errorView.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: errorView.centerXAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: 24).isActive = true
        closeButton.addTarget(self, action: #selector(self.close(sender:)), for: .touchUpInside)
    }
    
    private func showError() {
        errorView.isHidden = false
        loadingView.isHidden = true
    }
    
    private func showLoading() {
        errorView.isHidden = true
        loadingView.isHidden = false
    }
    
    @objc
    private func retry(sender: UIButton!) {
        showLoading()
        loadAppBundle()
    }
    
    @objc
    private func close(sender: UIButton!) {
        HestiaReactNativeApplication.shared.rootViewController?.finish()
    }
    
    private func loadAppBundle() {
        showLoading()
        let startedTime = Date.getCurrentMillis()
        bundleDownloader.resolveBundleFromManifest(app: app) { mainJsBundleUrl, error in
            if let mainJsBundleUrl = mainJsBundleUrl {
                HestiaReactNativeApplication.shared.rootViewController?.openReactNativeApp(for: mainJsBundleUrl)
            } else {
                let endedTime = Date.getCurrentMillis()
                if endedTime - startedTime < 1000 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                        self?.showError()
                    }
                } else {
                    self.showError()
                }
            }
        }
    }
}

