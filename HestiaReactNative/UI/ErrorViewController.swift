//
//  ErrorViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/22/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

class ErrorViewController : UIViewController {
    
    var mainJsBundleUrl: URL? = nil
    
    override func loadView() {
        super.loadView()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let errorLabel = UILabel()
        view.addSubview(errorLabel)
        errorLabel.text = "Something went wrong. Please try again!"
        errorLabel.textAlignment = .center
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.numberOfLines = 0
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        errorLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        let retryButton = UIButton(type: .system)
        retryButton.setTitle("Retry", for: .normal)
        view.addSubview(retryButton)
        retryButton.translatesAutoresizingMaskIntoConstraints = false
        retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        retryButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 24).isActive = true
        retryButton.addTarget(self, action: #selector(self.retry(sender:)), for: .touchUpInside)
        
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: retryButton.bottomAnchor, constant: 24).isActive = true
        closeButton.addTarget(self, action: #selector(self.close(sender:)), for: .touchUpInside)
    }
    
    @objc
    private func retry(sender: UIButton!) {
        if let mainJsBundleUrl = self.mainJsBundleUrl {
            HestiaReactNativeApplication.shared.rootViewController?.openReactNativeApp(for: mainJsBundleUrl)
        }
    }
    
    @objc
    private func close(sender: UIButton!) {
        HestiaReactNativeApplication.shared.rootViewController?.finish()
    }
}
