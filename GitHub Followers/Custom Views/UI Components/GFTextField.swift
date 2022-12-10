//
//  GFTextField.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func configure() {
        
        translatesAutoresizingMaskIntoConstraints   = false
        
        layer.cornerRadius                          = 10
        
        layer.borderWidth                           = 2
        
        layer.borderColor                           = UIColor.systemGray4.cgColor
        
        textColor                                   = .label
        
        tintColor                                   = .label
        
        adjustsFontSizeToFitWidth                   = true
        
        textAlignment                               = .center
        
        font                                        = UIFont.preferredFont(forTextStyle: .title2)
        
        minimumFontSize                             = 12
        
        returnKeyType                               = .go
        
        backgroundColor                             = .tertiarySystemBackground
        
        autocorrectionType                          = .no
        
        placeholder                                 = "Enter username"
        
    }
    
}
