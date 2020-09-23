//
//  HestiaReactNativeViewController.swift
//  HestiaReactNative
//
//  Created by batu on 9/19/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

class RootViewController : UIViewController {
    
    private var currentVC: UIViewController
    
    var delegate: HestiaDelegate?
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public init(clientId: String, app: HestiaApp, delegate: HestiaDelegate?) {
        self.currentVC = LoadingViewController(clientId: clientId, app: app)
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(currentVC)
        currentVC.view.frame = view.bounds
        view.addSubview(currentVC.view)
        currentVC.didMove(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func finish() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func openReactNativeApp(for mainJsBundleUrl: URL) {
        let reactNativeVC = ReactNativeViewController()
        reactNativeVC.mainJsBundleUrl = mainJsBundleUrl
        
        changeCurrentViewController(reactNativeVC)
    }
    
    func openErrorScreen() {
        guard let reactNativeVC = currentVC as? ReactNativeViewController else {
            return
        }
        guard let mainJsBundleUrl = reactNativeVC.mainJsBundleUrl else {
            return
        }
        
        DispatchQueue.main.async {
            let errorVC = ErrorViewController()
            errorVC.mainJsBundleUrl = mainJsBundleUrl
            self.changeCurrentViewController(errorVC)
        }
    }
    
    private func changeCurrentViewController(_ newCurrentVC: UIViewController) {
        addChild(newCurrentVC)
        newCurrentVC.view.frame = view.bounds
        view.addSubview(newCurrentVC.view)
        newCurrentVC.didMove(toParent: self)
        
        currentVC.willMove(toParent: nil)
        currentVC.view.removeFromSuperview()
        currentVC.removeFromParent()
        
        currentVC = newCurrentVC
    }
}
