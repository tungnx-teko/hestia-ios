//
//  MiniAppList.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/4/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MiniAppCell"

public protocol MiniAppListDelegate: class {
    func didSelectApp(appList: MiniAppList, appCode: String)
}

public class MiniAppList: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    public weak var delegate: MiniAppListDelegate?
    
    var apps: [HestiaApp] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.collectionView.backgroundColor = .white
        self.collectionView!.register(UINib(nibName: "MiniAppCell", bundle: Bundle(for: MiniAppCell.self)), forCellWithReuseIdentifier: reuseIdentifier)

        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Hestia.shared.fetchApplicationList(completion: { result in
            switch result {
            case .success(let apps):
                self.apps = apps
            case .failure(let error):
                print(error)
            }
        })
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MiniAppCell
        cell.configure(app: apps[indexPath.item])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 64, height: (collectionView.frame.height - 16)/2)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 48)
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appCode = apps[indexPath.item].code
        delegate?.didSelectApp(appList: self, appCode: appCode)
    }
    
    
}

extension MiniAppList: HestiaDelegate {
    
    public func callback(data: [String : Any]) {
        print(data)
    }
    
    
}
