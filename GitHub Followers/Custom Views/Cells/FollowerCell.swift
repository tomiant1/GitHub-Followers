//
//  FollowerCollectionViewCell.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/6/22.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func populateCellWithData(follower: Follower) {
        
        usernameLabel.text = follower.login
        
        avatarImageView.downloadImage(from: follower.avatarUrl)
        
    }
    
    
    private func configure() {
        
        addSubview(avatarImageView)
        
        configureAvatarImage()
        
        addSubview(usernameLabel)
        
        configureUsernameLabel()
        
    }
    
    
    private func configureAvatarImage() {
        
        NSLayoutConstraint.activate([
                    
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        
        ])
        
    }
    
    
    private func configureUsernameLabel() {
        
        NSLayoutConstraint.activate([
        
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: -8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
    }
    
    
}
