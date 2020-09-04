//
//  ViewController.swift
//  MiniApp
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia

class ViewController: UIViewController, AppViewController {
    
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        delegate?.onSuccess()
    }
    
    func setUp(launcherData: AppLauncherData?) {
        
    }
        
    func setUp(launcherData: AppLauncherData?, application: HestiaApplication) {
        self.delegate = application as? ViewControllerDelegate
    }
    
}



protocol ViewControllerDelegate {
    func onSuccess()
    func onFailure()
}
