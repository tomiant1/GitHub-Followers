//
//  GFRepoItemViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit

class GFRepoItemViewController: GFItemViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureItems()
        
    }
    
    
    private func configureItems() {
        
        midView.setTitleView(itemType: .repos, count: user.publicRepos)
        
        bottomView.setTitleView(itemType: .gists, count: user.publicGists)
        
        actionButton.setButton(backgroundColor: .systemPurple, title: "GitHub Profile")
        
    }
    
    override func buttonTapped() {
        
        delegate.didTapGitHubProfile(user: user)
        
    }

}
