//
//  ICrmCustomer.swift
//  TekServiceInterfaces
//
//  Created by Tung Nguyen on 8/7/20.
//

import Foundation

public protocol ICrmCustomer {
    var address: String? { get }
    var ageFrom: Int { get }
    var ageTo: Int { get }
    var asiaCrmId: String { get }
    var bankAccounts: [ICrmBankAccount] { get }
    var brandAwareness: [ICrmBrandAwareness] { get }
    var businessLicense: String? { get }
    var businessType: Int { get }
    var comment: String? { get }
    var contacts: [ICrmContact] { get }
    var dateOfBirth: String? { get }
    var debtLimit: Double { get }
    var district: String? { get }
    var districtId: String? { get }
    var email: String? { get }
    var extraInformation: [ICrmInformation] { get }
    var facebookLink: String? { get }
    var fax: String? { get }
    var gender: String? { get }
    var id: Int { get }
    var identification: String? { get }
    var income: Int { get }
    var isCompany: Bool { get }
    var isDeleted: Bool { get }
    var name: String? { get }
    var optionalPhone1: String? { get }
    var optionalPhone2: String? { get }
    var paymentPeriod: Int { get }
    var phone: String? { get }
    var province: String? { get }
    var provinceId: String? { get }
    var referenceId: Int { get }
    var scope: Int { get }
    var source: String? { get }
    var sourceId: String? { get }
    var taxAddress: String? { get }
    var taxCode: String? { get }
    var taxName: String? { get }
    var vats: [ICrmVat] { get }
    var ward: String? { get }
    var wardId: String? { get }
}
