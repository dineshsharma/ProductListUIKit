//
//  ProductDetailPageViewController.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 08/12/22.
//

import UIKit

class ProductDetailPageViewController: UIViewController {

    
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var favouriteIconButton: UIButton!
    
    var productListViewModel : ProductListViewModel = ProductListViewModel()
    var selectedProductIndexInProductList = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Product Detail"
        let productItem = self.productListViewModel.productsListArray[selectedProductIndexInProductList]
         
        self.productImageView.loadImageFromURL(urlString: productItem.imageURL)
        self.productNameLabel.text = productItem.title
        self.productPriceLabel.text = "Price: \(String(productItem.price[0].value))"
        self.ratingLabel.text = "Rating: \(String(productItem.ratingCount))"

        
        if productItem.isInWishlist {
            favouriteIconButton.setImage(UIImage(named:"favIcon.png"), for: .normal)
            favouriteIconButton.isSelected = true
        } else {
            favouriteIconButton.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            favouriteIconButton.isSelected = false
        }
}
    

    @IBAction func favUnFavButtonAction(_ sender: UIButton) {
        if (sender.isSelected) {
            sender.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            sender.isSelected = false
            self.productListViewModel.updateIsInWishlistValue(isFav: sender.isSelected, atIndex: selectedProductIndexInProductList)

        }
        else {
            sender.setImage(UIImage(named:"favIcon.png"), for: .normal)
            sender.isSelected = true
            self.productListViewModel.updateIsInWishlistValue(isFav: sender.isSelected, atIndex: selectedProductIndexInProductList)
        }
    }
}
