//
//  GFItemViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit


protocol ItemViewControllerDelegate: AnyObject {
    
    func didTapGitFollowers(user: User)
    func didTapGitHubProfile(user: User)
    
}

class GFItemViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let midView = GFItemView()
    
    let bottomView = GFItemView()
    
    let actionButton = GFButton()
    
    weak var delegate: ItemViewControllerDelegate!
    
    var user: User!
    
    init(user: User!) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.user = user
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        configureBackgroundView()
        
        configureStackView()
        
        layoutUI()
        
        configureButton()
        
    }
    
    
    private func configureBackgroundView() {
        
        view.layer.cornerRadius = 18
        
        view.backgroundColor = .secondarySystemBackground
        
    }
    
    
    private func configureButton() {
        
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    
    @objc func buttonTapped() { }
    
    
    private func configureStackView() {
        
        stackView.axis = .horizontal
        
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(midView)
        
        stackView.addArrangedSubview(bottomView )
        
    }
    
    private func layoutUI() {
        
        view.addSubview(stackView)
        
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        
        ])
        
        
    }

}
