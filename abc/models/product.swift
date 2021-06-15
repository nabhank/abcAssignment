//
//  product.swift
//  Painat
//
//  Created by MacBook Pro on 01/11/2020.
//  Copyright © 2020 painat. All rights reserved.
//

import Foundation

struct Product {
    
    var product_id:String
    var sales_price:String
    var product_qty:String
    var item_id:String
    var shop_id:String
    var title:String
    var sub_title:String
    var mrp:String
    var pur_rate:String
    var pr_prcnt:String
    var sp_prcnt:String
    var description:String
    var image:String
    
    
    
    init() {
        product_id = ""
        sales_price = ""
        product_qty = "0"
        item_id = ""
        shop_id = ""
        title = ""
        sub_title = ""
        mrp = ""
        pur_rate = ""
        pr_prcnt = ""
        sp_prcnt = ""
        description = ""
        image = ""
        
    }
    
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return
            lhs.product_id == rhs.product_id &&
            lhs.item_id == rhs.item_id &&
            lhs.shop_id == rhs.shop_id
    }
}
