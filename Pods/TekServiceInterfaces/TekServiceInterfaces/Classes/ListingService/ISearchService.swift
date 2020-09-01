//
//  ISearchService.swift
//  TekServiceInterfaces
//
//  Created by linhvt on 8/12/20.
//

import Foundation

public typealias SearchResponseHandler = (_ result: IProductsSearchResult?, _ isSuccess: Bool) -> ()

public enum SearchResponse: String {
    case keywords = "keywords"
    case products = "products"
    case filters = "filters"
}

public enum Filters: String {
    case brands = "brands"
    // Before it's attributeSets but now it's changed to sellerCategories
    /// all param labels "attributeSets" now it's can understand as "sellerCategories"
    case sellerCategories = "sellerCategories"
}

public enum ProductStatus: String {
    case active = "hang_ban"
    case showroom = "hang_trung_bay"
    case suspend = "ngung_kinh_doanh"
    case preorder = "hang_dat_truoc"
    case runningOut = "hang_sap_het"
    case new = "hang_moi_ve"
    case outOfStock = "out_of_stock"
}

public enum ProductSortCriteria: Int, CaseIterable {
    case `default`
    case popular // last 3 days
    case bestPromotion
    case priceLowToHigh
    case priceHighToLow
    case newest
    case last3Day
    case popularOneMonth
    case turnoverRate
    
    public var key: String? {
        switch self {
        case .default:
            return nil
        case .popular:
            return "quantity.last_3_day"
        case .bestPromotion:
            return "discount"
        case .priceHighToLow:
            return "bestPrice"
        case .priceLowToHigh:
            return "bestPrice"
        case .newest:
            return "new"
        case .popularOneMonth:
            return "quantity.last_1_month"
        case .last3Day:
            return "quantity.last_3_day"
        case .turnoverRate:
            return "turnover.last_1_week"
        }
    }
    
    public var order: String {
        switch self {
        case .priceLowToHigh:
            return "asc"
        default:
            return "desc"
        }
    }
    
}

public protocol ISearchService {
    func search(query: String,
                page: Int, limit: Int,
                responses: [SearchResponse], filters: [Filters],
                sort: [String], order: [String],
                hasPromotions: Bool?,
                brands: [String],
                attributeSets: [String],
                minPrice: Double?, maxPrice: Double?,
                saleStatusesNe: [ProductStatus],
                skus: [String],
                displayCategory: Int?,
                flashSaleType: String?, flashSaleGte: Double?, flashSaleLte: Double? ,
                sellerCategories: [Int], sellerIds: [Int],
                extraParams: [String: Any],
                handler: @escaping SearchResponseHandler)
    
    func custom(page: Int, params: [String : Any], handler: @escaping SearchResponseHandler)
}

public extension ISearchService {
    
    func filter(query: String,
                page: Int, limit: Int,
                filters: [Filters] = [.brands, .sellerCategories],
                sort: [String] = [], order: [String] = [],
                hasPromotions: Bool? = nil,
                brands: [String],
                attributeSets: [String] = [],
                minPrice: Double? = nil, maxPrice: Double? = nil,
                displayCategory: Int? = nil,
                sellerCategories: [Int] = [], sellerIds: [Int] = [],
                extraParams: [String: Any] = [:],
                handler: @escaping SearchResponseHandler) {
        search(query: query,
               page: page, limit: limit,
               responses: [], filters: filters,
               sort: sort, order: order,
               hasPromotions: hasPromotions,
               brands: brands,
               attributeSets: attributeSets,
               minPrice: minPrice, maxPrice: maxPrice,
               saleStatusesNe: [],
               skus: [],
               displayCategory: displayCategory,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: sellerCategories, sellerIds: sellerIds,
               extraParams: extraParams,
               handler: handler)
    }
    
    func searchSellerProduct(sellerIds: [Int],
                             extraParams: [String: Any] = [:],
                             page: Int,
                             limit: Int,
                             handler: @escaping SearchResponseHandler) {
        search(query: "",
               page: page,
               limit: limit,
               responses: [.products], filters: [],
               sort: [ProductSortCriteria.last3Day.key!], order: [ProductSortCriteria.last3Day.order],
               hasPromotions: nil,
               brands: [],
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [.suspend, .preorder],
               skus: [],
               displayCategory: nil,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: [], sellerIds: sellerIds,
               extraParams: extraParams,
               handler: handler)
    }
    
    
    func getPersonalDealProducts(categories: [Int],
                                 page: Int,
                                 limit: Int,
                                 sortCriteria: ProductSortCriteria = .last3Day,
                                 handler: @escaping SearchResponseHandler) {
        let sortParam = sortCriteria.key.isNilOrEmpty ? [] : [sortCriteria.key!]
        
        search(query: "",
               page: page,
               limit: limit,
               responses: [.products], filters: [],
               sort: sortParam, order: [sortCriteria.order],
               hasPromotions: nil,
               brands: [],
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [.suspend, .preorder],
               skus: [],
               displayCategory: nil,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: categories, sellerIds: [],
               extraParams: [:],
               handler: handler)

    }
    
    func searchProducts(brand: String,
                        sellerCategories: [Int],
                        page: Int,
                        limit: Int,
                        handler: @escaping SearchResponseHandler) {
        search(query: "",
               page: page,
               limit: limit,
               responses: [.products], filters: [.brands, .sellerCategories],
               sort: [], order: [],
               hasPromotions: nil,
               brands: [brand],
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [],
               skus: [],
               displayCategory: nil,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: sellerCategories, sellerIds: [],
               extraParams: [:],
               handler: handler)
     }
     
    func searchProducts(brands: [String],
                        sellerCategories: [Int],
                        page: Int, limit: Int,
                        handler: @escaping SearchResponseHandler) {
        search(query: "",
               page: page,
               limit: limit,
               responses: [.products], filters: [.brands, .sellerCategories],
               sort: [], order: [],
               hasPromotions: nil,
               brands: brands,
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [],
               skus: [],
               displayCategory: nil,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: sellerCategories, sellerIds: [],
               extraParams: [:],
               handler: handler)
     }
    
//    func searchKeywords(query: String,
//                        page: Int,
//                        limit: Int,
//                        handler: @escaping SearchResponseHandler) {
//        search(query: query,
//               page: page,
//               limit: limit,
//               responses: [.keywords], filters: [],
//               sort: [], order: [],
//               hasPromotions: nil,
//               brands: [],
//               attributeSets: [],
//               minPrice: nil, maxPrice: nil,
//               saleStatusesNe: [.suspend, .preorder],
//               skus: [],
//               displayCategory: nil,
//               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
//               sellerCategories: [], sellerIds: [],
//               extraParams: [:],
//               handler: handler)
//    }
    
    func searchProducts(query: String,
                        page: Int,
                        limit: Int,
                        sort: [String],
                        order: [String],
                        handler: @escaping SearchResponseHandler) {
        search(query: query,
               page: page,
               limit: limit,
               responses: [.products], filters: [],
               sort: sort, order: order,
               hasPromotions: nil,
               brands: [],
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [],
               skus: [],
               displayCategory: nil,
               flashSaleType: nil, flashSaleGte: nil, flashSaleLte: nil,
               sellerCategories: [], sellerIds: [],
               extraParams: [:],
               handler: handler)
    }
    
    func getFlashSaleProducts(page: Int, limit: Int, flashSaleGte: Double?, flashSaleLte: Double?, handler: @escaping SearchResponseHandler) {
        let now = Date().timeIntervalSince1970
        search(query: "",
               page: page,
               limit: limit,
               responses: [.products], filters: [],
               sort: [], order: [],
               hasPromotions: nil,
               brands: [],
               attributeSets: [],
               minPrice: nil, maxPrice: nil,
               saleStatusesNe: [.suspend, .preorder],
               skus: [],
               displayCategory: nil,
               flashSaleType: "GOLDEN_TIME", flashSaleGte: now, flashSaleLte: now + 1,
               sellerCategories: [], sellerIds: [],
               extraParams: [:],
               handler: handler)
    }
}

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        if let self = self {
            return self.isEmpty
        }
        return true
    }
    
    var orEmpty: [Wrapped.Element] {
        switch self {
        case .none:
            return []
        case .some(let collection):
            return Array(collection)
        }
    }

}
