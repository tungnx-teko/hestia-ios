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

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appList = MiniAppList(nibName: "MiniAppList", bundle: Bundle(for: MiniAppList.self))
        appList.delegate = self
        displayViewController(appList, in: containerView)
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

extension ViewController: MiniAppListDelegate {

    func didSelectApp(appList: MiniAppList, appCode: String) {
        guard let hestia = (UIApplication.shared.delegate as? AppDelegate)?.hestia else { return }
        hestia.startApp(appCode: appCode, delegate: nil, onSuccess: {
            print("Open app successfully")
        }) { error in
            self.showAlert(message: error.rawValue)
        }
    }
    
    func showAlert(message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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

