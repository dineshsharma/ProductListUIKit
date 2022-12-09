//
//  Extensions.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 09/12/22.
//

import Foundation
import UIKit

// Define image cache
var imageCache =  NSCache<AnyObject, AnyObject>()
// MARK: - Load Image from URL in Product List Cell
extension UIImageView {
    func loadImageFromURL(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

