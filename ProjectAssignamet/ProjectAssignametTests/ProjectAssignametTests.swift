//
//  ProjectAssignametTests.swift
//  ProjectAssignametTests
//
//  Created by Dinesh Sharma on 08/12/22.
//

import XCTest
@testable import ProjectAssignamet

final class ProjectAssignametTests: XCTestCase {
    var productsListArray:[Product] = []

    override func setUpWithError() throws {
      
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProductListData() {
        let dummyProductDataList = [Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true), Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true)]
        
        
        let viewModel = ProductListViewModel()
        viewModel.getProductList { result in
            viewModel.productsListArray = result?.products ?? []
            XCTAssert(viewModel.productsListArray.isEmpty,"")
            XCTAssert(((result?.products.isEmpty) != nil),"")
        }

        viewModel.productsListArray = dummyProductDataList
        XCTAssertEqual(viewModel.productsListArray.count, 2, "Product List count")
        
        for index in 0..<viewModel.productsListArray.count {
            let product = viewModel.productsListArray[index]
            let dummyData = dummyProductDataList[index]
            XCTAssertEqual(product.title, dummyData.title, "title")
            XCTAssertEqual(product.isInWishlist, dummyData.isInWishlist, "isInWishlist")
        }
        
    }
    
    func testProductPrice() {
        let dummyProductDataList = [Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true), Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true)]
        
        let viewModel = ProductListViewModel()
        viewModel.productsListArray = dummyProductDataList
        XCTAssertEqual(viewModel.productsListArray.count, 2, "Product List count")
        
        for index in 0..<viewModel.productsListArray.count {
            let productPrice = viewModel.productsListArray[index].price[0]
            let dummyDataPrice = dummyProductDataList[index].price[0]
            XCTAssertEqual(productPrice.value, dummyDataPrice.value, "Value")
            XCTAssertEqual(productPrice.isOfferPrice, dummyDataPrice.isOfferPrice, "isOfferPrice")
            XCTAssertEqual(productPrice.message, dummyDataPrice.message, "message")
        }
        
    }
    
    func testCheckAndClearFavouriteProductList() {
        let dummyProductDataList = [Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true), Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true)]
        
        let viewModel = ProductListViewModel()
        viewModel.productsListArray = dummyProductDataList
        viewModel.checkAndClearFavouriteProductList()
        XCTAssertEqual(viewModel.productsListArray.count, dummyProductDataList.count, "Result Count")
        XCTAssertEqual(FavouriteProductListSingleton.shared.favouriteProductList.isEmpty, true, "List")
    }
    
    func testUpdateFavouriteProductList() {
        let dummyProductDataList = [Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true), Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true)]
        
        let viewModel = ProductListViewModel()
        viewModel.productsListArray = dummyProductDataList
        viewModel.updateFavouriteProductList()
        XCTAssertEqual(viewModel.productsListArray.count, dummyProductDataList.count, "Result Count")
        XCTAssertEqual(FavouriteProductListSingleton.shared.favouriteProductList.isEmpty, false, "List")

    }
    
    func testUpdateFavouriteProductListWithFavourite() {
        let dummyProductDataList = [Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true), Product(citrusID: "123-ew-12", title: "Tombo", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], brand: "A", badges: [], ratingCount: 3.5, messages:Messages.init(secondaryMessage: nil, sash: Sash(), promotionalMessage: nil) , isAddToCartEnable: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, isInTrolley: false, isInWishlist: true, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 9.0, totalReviewCount: 10, isDeliveryOnly: false, isDirectFromSupplier: true)]
        
        let viewModel = ProductListViewModel()
        viewModel.productsListArray = dummyProductDataList
        viewModel.updateFavouriteProductList()
        XCTAssertEqual(viewModel.productsListArray.count, dummyProductDataList.count, "Result Count")
        XCTAssertEqual(FavouriteProductListSingleton.shared.favouriteProductList.isEmpty, false, "List")
    }
    
    
    
}
