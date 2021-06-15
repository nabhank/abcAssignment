//
//  product_TC.swift
//  abc
//
//  Created by MacBook Pro on 15/06/21.
//

import UIKit

class product_TC: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    
    
    func setCell(product:Product){
        
        self.name_lbl.text = product.title
        let stringUrl = product.image.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let url = URL(string: stringUrl!)!
        self.productImage.setImage(from: url, withPlaceholder: UIImage(named: ""))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
