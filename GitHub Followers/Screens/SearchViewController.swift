//
//  SearchViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    
    let usernameTextField = GFTextField()
    
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get followers")
    
    var usernameEntered: Bool { return !usernameTextField.text!.isEmpty }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureLogoImageView()
        
        configureTextField()
        
        configureCallToActionButton()
        
        createDismissKeyboardGesture()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func configureLogoImageView() {
        
        view.addSubview(logoImageView)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }
    
    func configureTextField() {
        
        view.addSubview(usernameTextField)
        
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
        
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        
        ])
        
    }
    
    func configureCallToActionButton() {
        
        view.addSubview(callToActionButton)
        
        // When button tapped, call this.
        
        callToActionButton.addTarget(self, action: #selector(pushFollowersViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }
    
    @objc func pushFollowersViewController() {
        
        guard usernameEntered else {
            
            present(GFAlertViewController(title: "Empty username", message: "Please try again.", buttonTitle: "OK"), animated: true)
            
            return
            
        }
        
        let followersViewController = FollowersViewController()
        
        followersViewController.title = usernameTextField.text
        
        followersViewController.username = usernameTextField.text
        
        navigationController?.pushViewController(followersViewController, animated: true)
        
    }
    
    func createDismissKeyboardGesture() {
        
        // Keyboard was the first responder (most recent view in the hierarchy), but now via .endEditing method it resigns whenever we tap somewhere on the screen outside the keyboard.
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        view.addGestureRecognizer(tap)
        
    }

}

extension SearchViewController: UITextFieldDelegate {
    
    // When go is tapped on a keyboard, do this action.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pushFollowersViewController()
        
        return true
        
    }
    
}
