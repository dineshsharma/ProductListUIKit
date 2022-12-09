//
//  ProductList.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 09/12/22.
//

import Foundation
// MARK: - ProductList
struct ProductListResponseData: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable {
    let citrusID: String?
    let title, id: String
    let imageURL: String
    let price: [Price]
    let brand: String
    let badges: [String]
    let ratingCount: Double
    let messages: Messages
    let isAddToCartEnable: Bool
    let addToCartButtonText: AddToCartButtonText
    var isInTrolley, isInWishlist: Bool
    let purchaseTypes: [PurchaseTypeElement]
    let isFindMeEnable: Bool
    let saleUnitPrice: Double
    let totalReviewCount: Int
    let isDeliveryOnly, isDirectFromSupplier: Bool

    enum CodingKeys: String, CodingKey {
        case citrusID = "citrusId"
        case title, id, imageURL, price, brand, badges, ratingCount, messages, isAddToCartEnable, addToCartButtonText, isInTrolley, isInWishlist, purchaseTypes, isFindMeEnable, saleUnitPrice, totalReviewCount, isDeliveryOnly, isDirectFromSupplier
    }
}

enum AddToCartButtonText: String, Decodable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Messages
struct Messages: Decodable {
    let secondaryMessage: String?
    let sash: Sash
    let promotionalMessage: String?
}

// MARK: - Sash
struct Sash: Decodable {
}

// MARK: - Price
struct Price: Decodable {
    let message: Message
    let value: Double
    let isOfferPrice: Bool
}

enum Message: String, Decodable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}

// MARK: - PurchaseTypeElement
struct PurchaseTypeElement: Decodable {
    let purchaseType: PurchaseTypeEnum
    let displayName: DisplayName
    let unitPrice: Double
    let minQtyLimit, maxQtyLimit, cartQty: Int
}

enum DisplayName: String, Decodable {
    case case6 = "case (6)"
    case each = "each"
    case perBottle = "per bottle"
    case perCaseOf6 = "per case of 6"
}

enum PurchaseTypeEnum: String, Decodable {
    case bottle = "Bottle"
    case purchaseTypeCase = "Case"
}
