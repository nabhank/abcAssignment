//
//  API.swift
//  Painat
//
//  Created by MacBook Pro on 30/10/2020.
//  Copyright © 2020 painat. All rights reserved.
//

import Foundation

extension API{
    
    func getCategories(completionHandlerforCategories: @escaping (_ result: [Category]?, _ error: NSError?)->Void) {
        
        let params = "{\"action\":\"getAllCategory\"}"
        
        let _ = taskForPOSTMethod(APIConstants.CATEGORIES, withToken: false, jsonBody: params) { (result, error) in
            if let error = error {
                completionHandlerforCategories(nil,error)
            }else{
                var categories: [Category] = []
                var category = Category()
                let dict = result as? [[String:AnyObject]]
                let cat_dic = dict?[0]
                let categories_array = cat_dic?["category_details"] as? [[String:AnyObject]]
                for categoryDict in categories_array! {
                    category.categoryId = "\(String(describing: categoryDict["category_id"]!))"
                    category.imgUrl = categoryDict["img"] as? String ?? ""
                    category.categoryName = categoryDict["cat_name"] as? String ?? ""
                    categories.append(category)
                }
                completionHandlerforCategories(categories,nil)
            }
        }
    }
    
    func getProducts(categoryId:String,completionHandlerforCategories: @escaping (_ result: [Product]?, _ error: NSError?)->Void) {
        
        let params = "{\"action\":\"getProductList\",\"category_id\": \"\(categoryId)\"}"
        print(params)
        let _ = taskForPOSTMethod(APIConstants.PRODUCTS, withToken: false, jsonBody: params) { (result, error) in
            print(result)
            if let error = error {
                completionHandlerforCategories(nil,error)
            }else{
                var products: [Product] = []
                var product = Product()
                let dict = result as? [[String:AnyObject]]
                let cat_dic = dict?[0]
                let products_array = cat_dic?["product_list"] as? [[String:AnyObject]] ?? []
                if products_array.count > 0{
                    for productDict in products_array {
                        product.description = productDict["description"] as? String ?? ""
                        product.image = productDict["image"] as? String ?? ""
                        product.item_id = "\(String(describing: productDict["item_id"]!))"
                        product.product_id = "\(String(describing: productDict["product_id"]!))"
                        product.mrp = "\(String(describing: productDict["mrp"]!))"
                        product.pr_prcnt = productDict["pr_prcnt"] as? String ?? ""
                        product.pur_rate = productDict["pur_rate"] as? String ?? ""
                        product.sales_price = "\(String(describing: productDict["sales_price"]!))"
                        product.shop_id = "\(String(describing: productDict["shop_id"]!))"
                        product.sp_prcnt = productDict["sp_prcnt"] as? String ?? ""
                        product.sub_title = productDict["sub_title"] as? String ?? ""
                        product.title = productDict["title"] as? String ?? ""
                        
                        products.append(product)
                    }
                }
                
                completionHandlerforCategories(products,nil)
            }
        }
    }
    
    
    func cart(cart:[Product],completionHandlerforCategories: @escaping (_ result: [Product]?, _ error: NSError?)->Void) {
        print(cart)
        let params = "{\"action\":\"getMyOrderSummary\",\"cart_list\": \(cart)}"
        print(params)
        let _ = taskForPOSTMethod(APIConstants.CATEGORIES, withToken: false, jsonBody: params) { (result, error) in
            print(result)
            if let error = error {
                completionHandlerforCategories(nil,error)
            }else{
                var products: [Product] = []
                var product = Product()
                let dict = result as? [[String:AnyObject]]
                let cat_dic = dict?[0]
                let products_array = cat_dic?["product_list"] as? [[String:AnyObject]] ?? []
                if products_array.count > 0{
                    for productDict in products_array {
                        product.description = productDict["description"] as? String ?? ""
                        product.image = productDict["image"] as? String ?? ""
                        product.item_id = "\(String(describing: productDict["item_id"]!))"
                        product.product_id = "\(String(describing: productDict["product_id"]!))"
                        product.mrp = "\(String(describing: productDict["mrp"]!))"
                        product.pr_prcnt = productDict["pr_prcnt"] as? String ?? ""
                        product.pur_rate = productDict["pur_rate"] as? String ?? ""
                        product.sales_price = "\(String(describing: productDict["sales_price"]!))"
                        product.shop_id = "\(String(describing: productDict["shop_id"]!))"
                        product.sp_prcnt = productDict["sp_prcnt"] as? String ?? ""
                        product.sub_title = productDict["sub_title"] as? String ?? ""
                        product.title = productDict["title"] as? String ?? ""
                        
                        products.append(product)
                    }
                }
                
                completionHandlerforCategories(products,nil)
            }
        }
    }
    
    
}
