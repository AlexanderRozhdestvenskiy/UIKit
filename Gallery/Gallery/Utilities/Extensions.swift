//
//  Extensions.swift
//  Gallery
//
//  Created by Alexander Rozhdestvenskiy on 09.12.2021.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
