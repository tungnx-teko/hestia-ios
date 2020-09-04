//
//  ViewController.swift
//  SuperAppTemplate
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Hestia
import Janus

class ViewController: UIViewController {

    @IBOutlet weak var containerView: MiniAppListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayViewController(MiniAppList(nibName: "MiniAppList", bundle: Bundle(for: MiniAppList.self)), in: containerView)
    }

    @IBAction func loginGoogleWasTapped(_ sender: Any) {
        let fbLogin = FacebookLogin(presentViewController: self, delegate: self)
        try? AuthLoginManager.shared.login(fbLogin)
    }
    
    func displayViewController(_ childVC: UIViewController, in view: UIView) {
        addChild(childVC)
        childVC.view.frame = view.bounds
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }
    func removeViewController(_ childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
}

extension ViewController: AuthLoginDelegate {
    
    func loginSuccess(accessToken: String, refreshToken: String) {
        print(accessToken)
    }
    
    func loginFail(error: AuthError?) {
        print("loi cmnr")
    }
    
}

