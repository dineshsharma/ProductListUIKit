//
//  FavouriteViewController.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 08/12/22.
//

import UIKit

class FavouriteListViewController: UITableViewController {

    var favouriteProductList: [Product] = []
    var updatedListArray:[Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //Register Custom Tableview cell
        let cellNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    func getProductList() {
        if !FavouriteProductListSingleton.shared.favouriteProductList.isEmpty {
            favouriteProductList = FavouriteProductListSingleton.shared.favouriteProductList
        } else{
            favouriteProductList = []
        }
        self.tableView.reloadData()

    }
    
    func updateUI() {
        var updatedListArray: [Product] = []
        if !FavouriteProductListSingleton.shared.favouriteProductList.isEmpty {
            for productItem in FavouriteProductListSingleton.shared.favouriteProductList {
                if productItem.isInWishlist {
                    updatedListArray.append(productItem)
                }
            }
            FavouriteProductListSingleton.shared.favouriteProductList = updatedListArray
            getProductList()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.favouriteProductList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let productItem = self.favouriteProductList[indexPath.row]
            cell.configure(productItem: productItem)
            // call the fav and unfav icon button when tapped
            cell.favouriteIconButton.addTarget(self, action: #selector(favAndUnFavTapped(_:)), for: .touchUpInside)
            cell.favouriteIconButton.tag = indexPath.row
        if productItem.isInWishlist {
            cell.favouriteIconButton.setImage(UIImage(named:"favIcon.png"), for: .normal)
            cell.favouriteIconButton.isSelected = true
        } else {
            cell.favouriteIconButton.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            cell.favouriteIconButton.isSelected = false
        }
            // call the Add to Cart button when tapped
            cell.addToCartButton.addTarget(self, action: #selector(addtoCartTapped(_:)), for: .touchUpInside)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favouriteDetailViewController = storyboard?.instantiateViewController(withIdentifier: "FavouriteProductDetailViewController") as! FavouriteProductDetailViewController
        favouriteDetailViewController.selectedProductIndexInProductList =  indexPath.row
        self.navigationController?.pushViewController(favouriteDetailViewController, animated: false)
    }
    
    // MARK: - Fav and unfav Action

    @objc func favAndUnFavTapped(_ sender: UIButton){
        print(sender.tag)
        if (sender.isSelected) {
            sender.setImage(UIImage(named:"unfavIcon.png"), for: .normal)
            sender.isSelected = false
            FavouriteProductListSingleton.shared.favouriteProductList[sender.tag].isInWishlist = sender.isSelected
            updateUI()
        }
        else {
            sender.setImage(UIImage(named:"favIcon.png"), for: .normal)
            sender.isSelected = true
            //productListViewModel.productsListArray[sender.tag].isInWishlist = sender.isSelected
            FavouriteProductListSingleton.shared.favouriteProductList[sender.tag].isInWishlist = sender.isSelected
            updateUI()
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
