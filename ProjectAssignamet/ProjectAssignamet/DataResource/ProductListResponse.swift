//
//  DataResource.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 09/12/22.
//

import Foundation

import Foundation

struct ProductListResponse
{
    func getProductList(completion: @escaping(_ result : ProductListResponseData?) -> Void)
    {
        let httpUtility = HttpUtility()

        let productListEndpoint = ApiEndpoint.productList

        let requestUrl = URL(string:productListEndpoint)!

        httpUtility.getApiData(requestUrl: requestUrl, resultType: ProductListResponseData.self) { (productListApiResponse) in

            _ = completion(productListApiResponse)
        }
    }
}

