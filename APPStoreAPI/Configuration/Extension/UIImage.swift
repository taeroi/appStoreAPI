//
//  UIImage.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

extension UIImageView {
    func load(urlString : String, contentMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else{return}
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
