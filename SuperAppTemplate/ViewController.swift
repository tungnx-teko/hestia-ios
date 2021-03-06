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
        JanusLoginManager.shared.login(FacebookLogin(presentViewController: self, delegate: nil))
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
        Hestia.shared.startApp(onViewController: self, appCode: appCode, delegate: nil, onSuccess: {
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

extension ViewController: JanusLoginDelegate {
    
    func loginSuccess(accessToken: String, refreshToken: String) {
        print(accessToken)
    }
    
    func loginFail(error: JanusError?) {
        print("loi cmnr")
    }
    
}

