//
//  GFAlertViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//

import UIKit

class GFAlertViewController: UIViewController {

    let containerView = UIView()
    
    let titleLabel = GFTitleLabel()
    
    let messageLabel = GFBodyLabel()
    
    let actionButton = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    
    var message: String?
    
    var buttonTitle: String?
    
    let paddingConstant: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        
        self.message = message
        
        self.buttonTitle = buttonTitle
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerView()
        
        configureTitleLabel()
        
        configureButton()
        
        configureMessageLabel()
        
    }

    func configureContainerView() {
        
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        
        containerView.layer.cornerRadius = 16
        
        containerView.layer.borderWidth = 2
        
        containerView.layer.borderColor = UIColor.white.cgColor
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        
        ])
        
    }
    
    func configureTitleLabel() {
        
        containerView.addSubview(titleLabel)
        
        titleLabel.text = alertTitle ?? "Title error: something went wrong"
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddingConstant),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingConstant),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingConstant),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
    }
    
    func configureMessageLabel() {
        
        view.addSubview(messageLabel)
        
        messageLabel.text = message ?? "Body text error: something went wrong"
        
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
        
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingConstant),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingConstant),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        
        ])
        
    }
    
    func configureButton() {
        
        view.addSubview(actionButton)
        
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        
        actionButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
        
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddingConstant),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddingConstant),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingConstant),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        
        ])
        
    }
    
    @objc func dismissViewController() {
        
        dismiss(animated: true)
        
    }
    
}
