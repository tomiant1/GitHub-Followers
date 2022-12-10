//
//  GFItemView.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit


enum ItemType { case repos, followers, following, gists }


class GFItemView: UIView {

    let iconImageView = UIImageView()
    
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func configure() {
        
        addSubview(iconImageView)
        
        addSubview(titleLabel)
        
        addSubview(countLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.contentMode = .scaleAspectFill
        
        iconImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
        
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12),
            
            countLabel.heightAnchor.constraint(equalToConstant: 18),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4)
            
        ])
        
    }
    
    
    func setTitleView(itemType: ItemType, count: Int) {
        
        switch itemType {
            
        case .followers:
            iconImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
            
        case .repos:
            iconImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
            
        case .following:
            iconImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
            
        case .gists:
            iconImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
            
        }
        
        countLabel.text = String(count)
        
    }
    
}
