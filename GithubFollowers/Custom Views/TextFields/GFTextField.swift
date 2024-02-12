//
//  GFTextField.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 9/1/24.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        //.label = White for dark mode, black for light mode
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        placeholder = "Enter a username"
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
}
