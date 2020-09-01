//
//  IPageBuilderService.swift
//  VNShop
//
//  Created by Dung Nguyen on 12/17/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation

public typealias BannerResponseHandler = (_ result: IBannerResult?, _ isSuccess: Bool) -> ()

public protocol IPageBuilderService {
    func getBanners(page: Int, handler: @escaping BannerResponseHandler)
}

