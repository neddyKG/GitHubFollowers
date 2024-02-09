//
//  GFTitleLabel.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 10/1/24.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
/*    convenience has to call one of the designated initializers for the object, in this case it's
 override init(frame: CGRect) {
     super.init(frame: frame)
 }
 
 Another thing pro about the convenience init is that it could set default values to parameters.
 ex. let's say ypu have 7 params, the convenience can set 5 default vals and you just have to pass 2.
 */
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        // 90%, it'll allow to shrink a little bit. The lower the %, the more it'll shrink.
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
