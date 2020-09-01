//
//  UserService.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/11/20.
//

import Foundation

public protocol IUserService {
    // User address
    func addAddress(address: IUserAddress, completion: @escaping (IUserAddress?) -> ())
    func updateAddress(address: IUserAddress, completion: @escaping (String?) -> ())
    func getListAddress(completion: @escaping ([IUserAddress]) -> ())
    func deleteAddress(id: String, completion: @escaping (Bool) -> ())
    
    // User info
    func getUserInfo(completion: @escaping (IUserInfo?) -> ())
    func updateUserInfo(userInfo: IUserInfo, completion: @escaping (IUserInfo?) -> ())
}
