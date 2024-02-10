//
//  GFBodyLabel.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/1/24.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
//        Dynamic type font size = adjustsFontForContentSizeCategory.
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        // 90%, it'll allow to shrink a little bit. The lower the %, the more it'll shrink.
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
