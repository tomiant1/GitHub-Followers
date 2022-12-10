//
//  GFButton.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//
// We call super.init because we want to inherit everything that Apple has prebuilt in their UIButton implementation
// private prevents calling method in an instance of that class. Can be called only *within* the class

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    init(backgroundColor: UIColor, title: String) {
        
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        self.setTitle(title, for: .normal)
        
        configure()
        
    }
    
    private func configure() {
        
        layer.cornerRadius = 10
        
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func setButton(backgroundColor: UIColor, title: String) {
        
        self.backgroundColor = backgroundColor
        
        self.setTitle(title, for: .normal)
        
        
    }
    
}
