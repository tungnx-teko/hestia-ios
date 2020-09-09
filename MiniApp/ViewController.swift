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
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "This is a native mini app"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        view.backgroundColor = .systemGreen
        
        delegate?.onSuccess()
    }
    
    func addSubviews() {
        view.addSubview(backButton)
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func setUp(launcherData: AppLauncherData?, application: HestiaApplication) {
        self.delegate = application as? ViewControllerDelegate
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



protocol ViewControllerDelegate {
    func onSuccess()
    func onFailure()
}
