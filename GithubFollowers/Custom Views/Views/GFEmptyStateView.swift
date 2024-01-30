//
//  GFEmptyStateView.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 30/1/24.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let spacingMessageLabel: CGFloat = 40
        
        // It's better to use leading and trailing, than left right. Cause of phone flip.
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: spacingMessageLabel),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -spacingMessageLabel),
            // The height is hardcoded to 200 cause the text is defined, not dynamic.
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            // Make the image width 30% larger than the width of the view (which is of the screen in this case)
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 180),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 130),
        ])
    }
}
