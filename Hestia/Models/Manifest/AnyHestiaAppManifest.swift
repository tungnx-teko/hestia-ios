//
//  AnyHestiaAppManifest.swift
//  Hestia
//
//  Created by Tung Nguyen on 9/3/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

public struct AnyHestiaAppManifest: HestiaAppManifest {

    public typealias DataType = HestiaManifestData
    
    private let box: AnyManifestBox
    
    public init<Base>(_ base: Base) where Base: HestiaAppManifest {
        if let anyManifest = base as? AnyHestiaAppManifest {
            self = anyManifest
        } else {
            self.box = Box(base: base)
        }
    }
    
    public var base: Any { box.base }
    public var data: HestiaManifestData? { box.data }
    public var extra: [String: Any]? { box.extra }
}

private protocol AnyManifestBox {
    var base: Any { get }
    var data: HestiaManifestData? { get }
    var extra: [String : Any]? { get }
}

private struct Box<Base>: AnyManifestBox where Base: HestiaAppManifest {
    let _base: Base
    
    init(base: Base) {
        self._base = base
    }
    
    var base: Any { _base }

    var data: HestiaManifestData? { _base.data }
    var extra: [String: Any]? { _base.extra }
}
