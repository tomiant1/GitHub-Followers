//
//  UserInfoViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit


protocol UserInfoViewControllerDelegate: AnyObject {
    
    func didRequestFollowers(username: String)
    
}

class UserInfoViewController: UIViewController {
    
    let topView = UIView()
    
    let midView = UIView()
    
    let bottomView = UIView()
    
    var itemViews: [UIView] = []
    
    weak var delegate: UserInfoViewControllerDelegate!
    
    var username: String!

    override func viewDidLoad() {
        
        super.viewDidLoad()

        configureViewController()
        
        layoutUI()
        
        getUserInfo()

    }
    
    
    func getUserInfo() {
        
        NetworkManager.shared.getUserData(for: username) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let userData):
                
                DispatchQueue.main.async { self.configureUIElements(user: userData) }
                
            case .failure(let error):
                
                print(error)
                
            }
            
        }
        
    }
    
    func configureUIElements(user: User) {
        
        let headerViewController = GFHeaderViewController(user: user)
        
        let repoItemViewController = GFRepoItemViewController(user: user)
        
        repoItemViewController.delegate = self
        
        let followerViewController = GFFollowerViewController(user: user)
        
        followerViewController.delegate = self
        
        self.addViewController(childViewController: headerViewController, childContainerView: self.topView)
        
        self.addViewController(childViewController: repoItemViewController, childContainerView: self.midView)
        
        self.addViewController(childViewController: followerViewController, childContainerView: self.bottomView)
        
    }
    
    
    func configureViewController() {
        
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
    
    func layoutUI() {
        
        let padding: CGFloat = 20
        
        let itemHeight: CGFloat = 140
        
        itemViews = [topView, midView, bottomView]
        
        for itemView in itemViews {
            
            view.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
            
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
                
            ])
            
        }
        
        
        
        NSLayoutConstraint.activate([
        
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.heightAnchor.constraint(equalToConstant: 180),
            
            midView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: padding),
            midView.heightAnchor.constraint(equalToConstant: itemHeight),
            
            bottomView.topAnchor.constraint(equalTo: midView.bottomAnchor, constant: padding),
            bottomView.heightAnchor.constraint(equalToConstant: itemHeight)
            
        ])
        
    }
    
    
    
    func addViewController(childViewController: UIViewController, childContainerView: UIView) {
        
        addChild(childViewController)
        
        childContainerView.addSubview(childViewController.view)
        
        childViewController.view.frame = childContainerView.bounds
        
        childViewController.didMove(toParent: self)
        
    }
    
    @objc func dismissVC() {
        
        dismiss(animated: true)
        
    }
  
}


extension UserInfoViewController: ItemViewControllerDelegate {

    func didTapGitHubProfile(user: User) {
        
        guard let url = URL(string: user.htmlUrl) else {
            
            presentGFAlertOnMainThread(title: "Invalid URL", message: "Cannot fetch data based on URL.", buttonTitle: "OK")
            
            return
            
        }
        
        presentSafariViewController(url: url)
       
    }
    
    
    func didTapGitFollowers(user: User) {
        
        guard user.followers != 0 else {
            
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers.", buttonTitle: "OK")
            
            return
            
        }
        
        delegate.didRequestFollowers(username: user.login)
        
        dismissVC()
        
    }
    
}
