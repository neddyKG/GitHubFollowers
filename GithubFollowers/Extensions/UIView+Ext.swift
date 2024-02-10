//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/2/24.
//

import UIKit

// UIView... = variadic parameter -> converts to an array of views.
extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
