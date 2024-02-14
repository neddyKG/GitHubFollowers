//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 16/1/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.avatarPlaceholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadAvatarImage(fromUrl url: String) {
        Task {
            image = await NetworkManager.shared.downloadImage(from: url) ?? placeholderImage
        }
    }
}
