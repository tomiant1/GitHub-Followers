//
//  FavoriteCell.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/9/22.
//

import UIKit

class FavoriteCell: UITableViewCell {

    
    static let reuseIdentifier = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    private func configure() {
        
        addSubview(avatarImageView)
        
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
        
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
    }
    
    
    func populateCellWithData(favorite: Follower) {
        
        usernameLabel.text = favorite.login
        
        avatarImageView.downloadImage(from: favorite.avatarUrl)
        
    }

}
