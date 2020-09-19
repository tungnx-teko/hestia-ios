//
//  LoadingViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoading()        
    }

    private func setupLoading() {
        view.addSubview(loadingIndicator)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicator.startAnimating();
    }
}

