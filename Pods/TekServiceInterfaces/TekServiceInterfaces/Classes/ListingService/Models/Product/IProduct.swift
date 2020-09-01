//
//  IProduct.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/5/20.
//

import Foundation

public protocol IProduct {
    var sku: String { get }
    var name: String { get }
    var url: String? { get }
    var brand: IBrand? { get }
    var status: IStatus? { get }
    var objective: IObjective? { get }
    var productType: IProductType? { get }
    var images: [IImage] { get }
    var price: IPrice? { get }
    var productLine: IProductLine? { get }
    var stocks: [IStock] { get }
    var totalAvailable: Int? { get }
    var isBundle: Bool? { get }
    var parentBundles: [IParentBundle] { get }
    var totalAvailableByStocks: [ITotalAvailableByStocks] { get }
    var totalAvailableByStores: [IAvailableByStoreObject] { get }
    var displayName: String? { get }
    var color: IColor? { get }
    var tags: [String] { get }
    var promotionPrices: [IPromotionPrice] { get }
    var promotions: [IPromotion] { get }
    var seller: ISeller? { get }
    var flashSales: [IFlashSale] { get }
    var attributeSet: IAttributeSet? { get }
    var categories: [ICategory] { get }
    var magentoId: Int? { get }
    var seoInfo: ISeoInfo? { get }
    var rating: IRating? { get }
    var allActiveFlashSales: [IActiveFlashSale] { get }
    var attributeGroups: [IAttributeGroup] { get }
    var taxOut: Double { get }
    var taxOutCode: String { get }
    var warranty: IWarranty? { get }
    var createdAt: String? { get }
    var salePoint: Int? { get }
    var bundleProducts: [IBundleProduct] { get }
    var productGroup: IProductGroup? { get }
    var provider: IProvider? { get }
}
