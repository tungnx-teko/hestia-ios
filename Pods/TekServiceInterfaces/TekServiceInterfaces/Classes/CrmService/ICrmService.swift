//
//  ICrmService.swift
//  Pods-TekServiceInterfaces_Tests
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public typealias CrmResponseHandler = (ICrmCustomer?, ICrmError?) -> ()

public protocol ICrmService {
    func getCustomer(id: String, completion: @escaping CrmResponseHandler)
    func addAddressToCustomer(id: String, contact: ICrmContact, completion: @escaping CrmResponseHandler)
    func create(payload: ICrmPayload, completion: @escaping CrmResponseHandler)
    func deleteContact(id: String, contact: ICrmContact, completion: @escaping (Bool) -> ())
}
