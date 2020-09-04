//
//  HestiaRootViewController.swift
//  Hestia
//
//  Created by Tung Nguyen on 8/14/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

public protocol AppViewController {
    init()
    func setUp(launcherData: AppLauncherData?)
}
