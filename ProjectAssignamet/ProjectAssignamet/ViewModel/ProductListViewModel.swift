//
//  ProductListViewModel.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 09/12/22.
//

import Foundation

protocol ProductListUpdate:AnyObject {
    func updateList(productList:[Product])
}

class ProductListViewModel
{
    var productsListArray:[Product] = []
    weak var delegte: ProductListUpdate?

    // API Call - GetProduct List
    func getProductList(completion: @escaping(_ result: ProductListResponseData?)-> Void)
    {
        let productListResource = ProductListResponse()
        productListResource.getProductList { productListResponse in
            _ = completion(productListResponse)
        }
    }
    
    //Get Favourite Product List array
    func updateFavouriteProductList() {
        var favouriteProductsListArray:[Product] = []
        if !productsListArray.isEmpty {
            for productItem in productsListArray {
                if productItem.isInWishlist {
                    favouriteProductsListArray.append(productItem)
                }
            }
            FavouriteProductListSingleton.shared.favouriteProductList = favouriteProductsListArray
        }
    }
    
    func checkAndClearFavouriteProductList() {
        if FavouriteProductListSingleton.shared.favouriteProductList.isEmpty {
            var tempProductListArray:[Product] = []
            if !productsListArray.isEmpty {
                for var productItem in productsListArray {
                    productItem.isInWishlist = false
                    tempProductListArray.append(productItem)
                }
                productsListArray = tempProductListArray
            }
        }
    }
    
    // Update IsInWishlist value for Fav and Unfav
    func updateIsInWishlistValue(isFav: Bool, atIndex: Int) {
        self.productsListArray[atIndex].isInWishlist = isFav
        self.delegte?.updateList(productList: self.productsListArray)
        updateFavouriteProductList()
    }
}

