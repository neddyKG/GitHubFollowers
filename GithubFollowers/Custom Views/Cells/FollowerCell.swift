//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 16/1/24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        downloadAvatarImage(of: follower.avatarUrl)
    }
    
    func downloadAvatarImage(of followerAvatarUrl: String) {
        NetworkManager.shared.downloadImage(from: followerAvatarUrl) { [weak self] image in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.avatarImageView.image = image
            }
        }
    }
    
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        
        let padding: CGFloat = 8
        
        // All cells have contentView
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}
