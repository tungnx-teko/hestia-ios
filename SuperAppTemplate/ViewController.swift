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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginGoogleWasTapped(_ sender: Any) {
        let fbLogin = FacebookLogin(presentViewController: self, delegate: self)
        try? AuthLoginManager.shared.login(fbLogin)
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

