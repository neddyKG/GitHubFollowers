//
//  GFContainerView.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 11/1/24.
//

import UIKit

class GFContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(containerBackgroundColor: UIColor, borderColor: CGColor) {
        super.init(frame: .zero)
        self.backgroundColor = containerBackgroundColor
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderColor = borderColor
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
