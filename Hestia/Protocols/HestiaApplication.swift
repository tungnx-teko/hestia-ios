//
//  HestiaApplication.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation
import UIKit

// This is root application of super app to contains Mini apps

public protocol HestiaApplication {
    func open(_ viewController: UIViewController)
}

public extension HestiaApplication where Self: UIApplication {
    
    func open(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        topViewController()?.present(viewController, animated: true, completion: nil)
    }
    
}

public extension HestiaApplication where Self: UIViewController {
    
    func open(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true, completion: nil)
    }
    
}
