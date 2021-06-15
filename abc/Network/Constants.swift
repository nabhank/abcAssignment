//
//  Constants.swift
//  Painat
//
//  Created by MacBook Pro on 30/10/2020.
//  Copyright © 2020 painat. All rights reserved.
//

import Foundation

struct APIConstants {

    
    struct HeaderValues {
         static let CLIENT_AUTH_TOKEN = "Client-Auth-Token"
         static let TOKEN_DEFAULT_VALUE_FOR_TEST = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRJZCI6OTEzLCJpc0d1ZXN0IjpmYWxzZX0.xlD_ZWGz2eyLXZhGmhix7X5YF4_cKttj3di1YL9sfbo"
     }
    
    private static let BASIC = "https://utrolly.techandon.com/"
    private static let MAIN = BASIC + "app_api/"
    static let CATEGORIES = MAIN + "customer_index.php"
    static let  PRODUCTS = MAIN + "customer_api.php"
}
