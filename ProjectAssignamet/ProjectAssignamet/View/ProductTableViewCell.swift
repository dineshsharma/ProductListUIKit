//
//  ProductTableViewCell.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 08/12/22.
//

import UIKit


class ProductTableViewCell: UITableViewCell {

    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var addToCartButton: UIButton!
    @IBOutlet var favouriteIconButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(productItem: Product) {
        self.productNameLabel.text = productItem.title
        self.productPriceLabel.text = "Price: \(String(productItem.price[0].value))"
        self.productImageView.loadImageFromURL(urlString: productItem.imageURL)
        self.addToCartButton.setTitle("\(productItem.addToCartButtonText.rawValue)", for: .normal)

    }
  
}
