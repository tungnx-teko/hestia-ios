//
//  HestiaReactNativeViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

class HestiaReactNativeViewController: UIViewController {
    
    private var current: UIViewController
    
    private let manifest: ReactNativeAppManifest
    var delegate: HestiaDelegate?
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init(manifest: ReactNativeAppManifest, delegate: HestiaDelegate?) {
        self.current = LoadingViewController()
        self.manifest = manifest
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    override func loadView() {
        super.loadView()
        
        let leftMenuItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back))
        self.navigationItem.setLeftBarButton(leftMenuItem, animated: false)
    }
    
    @objc func back() {
       navigationController?.dismiss(animated: true, completion: nil)
    }
}
