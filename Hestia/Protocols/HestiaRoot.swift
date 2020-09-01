//
//  HestiaRootViewController.swift
//  Hestia
//
//  Created by Tung Nguyen on 8/14/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

public protocol HestiaRoot: AnyObject {
    init()
    var currentViewController: UIViewController? { get set }
    
    func setUp(launcherData: AppLauncherData?)
}

extension HestiaRoot where Self: UIViewController {
    
    public func show(viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        currentViewController = viewController
    }
    
}
