//
//  FavouriteProductListSingleton.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 09/12/22.
//

import Foundation

class FavouriteProductListSingleton {
    static let shared = FavouriteProductListSingleton()
    init(){}
    var favouriteProductList: [Product] = []
}
