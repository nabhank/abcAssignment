//
//  Category_CC.swift
//  abc
//
//  Created by MacBook Pro on 15/06/21.
//

import UIKit

class Category_CC: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func setCell(category:Category){
        
        let stringUrl = category.imgUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        print(stringUrl)
        let url = URL(string: stringUrl!)!
        self.image.setImage(from: url, withPlaceholder: UIImage(named: ""))
    }
    
}
