//
//  ILocationService.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public typealias GetAddressListHandler = (_ result: [IAddress]) -> ()
public typealias GetWardDetailHandler = (_ wardDetail: IWard?) -> ()

public protocol ILocationService {
    func getProvinceList(handler: @escaping GetAddressListHandler)
    func getDistrictList(provinceCode: String, handler: @escaping GetAddressListHandler)
    func getWardList(districtCode: String, handler: @escaping GetAddressListHandler)
    func getWardDetail(wardCode: String, handler: @escaping GetWardDetailHandler)
}
