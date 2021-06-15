//
//  viewController_extention.swift
//  Painat
//
//  Created by MacBook Pro on 30/10/2020.
//  Copyright © 2020 painat. All rights reserved.
//

import UIKit

extension UIViewController{

    func startAnActivityIndicator() -> UIActivityIndicatorView {
        if #available(iOS 13.0, *) {
            let ai = UIActivityIndicatorView(style: .large)
            ai.color = UIColor(named: "baseColor")
            self.view.addSubview(ai)
            self.view.bringSubviewToFront(ai)
            ai.center = self.view.center
            ai.hidesWhenStopped = true
            ai.startAnimating()
            return ai
        } else {
            let ai = UIActivityIndicatorView(style: .gray)
            ai.color = UIColor(named: "baseColor")
            self.view.addSubview(ai)
            self.view.bringSubviewToFront(ai)
            ai.center = self.view.center
            ai.hidesWhenStopped = true
            ai.startAnimating()
            return ai
        }
        
    }

}


extension UIImageView {
    func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
        self.image = placeholder
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
