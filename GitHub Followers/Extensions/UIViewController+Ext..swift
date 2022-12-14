//
//  UIViewController+Ext..swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//
// Available to any UIViewController

import UIKit
import SafariServices


fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            
            let alertViewController = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            
            alertViewController.modalPresentationStyle = .overFullScreen
            
            alertViewController.modalTransitionStyle = .crossDissolve
            
            self.present(alertViewController, animated: true)
            
        }
        
    }
    
    
    func showLoadingView() {
        
        containerView = UIView(frame: view.bounds)
        
        containerView.backgroundColor = .systemBackground
        
        containerView.alpha = 0
        
        view.addSubview(containerView)
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
        activityIndicator.startAnimating()
        
    }
    
    func dismissLoadingView() {
        
        DispatchQueue.main.async {
            
            containerView.removeFromSuperview()
            
            containerView = nil
            
        }
        
    }     
    
    func showEmptyStateView(with message: String, in view: UIView) {
        
        let emptyStateView = GFEmptyStateView(message: message)
        
        emptyStateView.frame = view.bounds
        
        view.addSubview(emptyStateView)
        
    }
    
    
    func presentSafariViewController(url: URL) {
        
        let safariViewController = SFSafariViewController(url: url)
        
        safariViewController.preferredControlTintColor = .systemGreen
        
        present(safariViewController, animated: true)
        
    }
    
}
