//
//  GFFollowerViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit

class GFFollowerViewController: GFItemViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        configureItems()
        
    }
    
    
    private func configureItems() {
        
        midView.setTitleView(itemType: .followers, count: user.followers)
        
        bottomView.setTitleView(itemType: .following, count: user.following)
        
        actionButton.setButton(backgroundColor: .systemGreen, title: "Get Followers ")
        
    }
    
    override func buttonTapped() {
        
        delegate.didTapGitFollowers(user: user)
        
    }

}
