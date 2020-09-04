//
//  MiniAppCell.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit
import Kingfisher

class MiniAppCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
        iconImageView.image = HestiaBundle.getImage(named: "app_icon")
    }

    func configure(app: HestiaApp) {
//        iconImageView.kf.setImage(with: URL(string: app.icon))
        nameLabel.text = app.name
    }
    
}
