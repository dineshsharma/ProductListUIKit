//
//  ProductListViewController.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 08/12/22.
//

import UIKit

class ProductListViewController: UITableViewController , ProductListUpdate {
    func updateList(productList: [Product]) {
        productListViewModel.productsListArray = productList
    }
    
    var productListViewModel : ProductListViewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Register Custom Tableview cell
        productListViewModel.delegte = self
        let cellNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "ProductTableViewCell")
        getProductList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productListViewModel.checkAndClearFavouriteProductList()
        if !self.productListViewModel.productsListArray.isEmpty {
            self.tableView.reloadData()
        }
        
    }
    
    private func getProductList() {
        productListViewModel.getProductList { productListAPIResponse in
            if(productListAPIResponse != nil) {
                guard let productListArray = productListAPIResponse?.products else {
                    return
                }
                self.productListViewModel.productsListArray = productListArray
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.productListViewModel.productsListArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let productItem = self.productListViewModel.productsListArray[indexPath.row]
            cell.configure(productItem: productItem)
            // call the fav and unfav icon button when tapped
            cell.favouriteIconButton.addTarget(self, action: #selector(favAndUnFavTapped(_:)), for: .touchUpInside)
            cell.favouriteIconButton.tag = indexPath.row
        if productItem.isInWishlist {
            cell.favouriteIconButton.setImage(UIImage(named:"favIcon.png"), for: .normal)
            cell.favouriteIconButton.isSelected = true
            //productListViewModel.favUnFavTapped(isFav: false, indexInProductListArray: indexPath.row)
        } else {
            cell.favouriteIconButton.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            cell.favouriteIconButton.isSelected = false
            //productListViewModel.favUnFavTapped(isFav: true, indexInProductListArray: indexPath.row)
        }
            // call the Add to Cart button when tapped
            cell.addToCartButton.addTarget(self, action: #selector(addtoCartTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailViewController = storyboard?.instantiateViewController(withIdentifier: "ProductDetailPageViewController") as! ProductDetailPageViewController
        productDetailViewController.selectedProductIndexInProductList =  indexPath.row
        productDetailViewController.productListViewModel = productListViewModel
        self.navigationController?.pushViewController(productDetailViewController, animated: false)
    }
    
    // MARK: - Fav and unfav Action

    @objc func favAndUnFavTapped(_ sender: UIButton){
        print(sender.tag)
        if (sender.isSelected) {
            sender.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            sender.isSelected = false
            //productListViewModel.productsListArray[sender.tag].isInWishlist = sender.isSelected
            self.productListViewModel.updateIsInWishlistValue(isFav: sender.isSelected, atIndex: sender.tag)
        }
        else {
            sender.setImage(UIImage(named:"favIcon.png"), for: .normal)
            sender.isSelected = true
            //productListViewModel.productsListArray[sender.tag].isInWishlist = sender.isSelected
            self.productListViewModel.updateIsInWishlistValue(isFav: sender.isSelected, atIndex: sender.tag)
        }
    }
    
    // MARK: - AddToCart Action

    @objc func addtoCartTapped(_ sender: UIButton){
        let alert = UIAlertController(title: "Add To Cart", message: "", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alert.addAction(okAction)
      self.present(alert, animated: true, completion: nil)
    }
}
