//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 04/03/2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = UIImage(resource: .avatarPlaceholderDark)

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
    
    func setImage(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { [weak self] image in
               guard let self = self else { return }
               self.image = image
        }
    }

}
