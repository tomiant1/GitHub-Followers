//
//  GFBodyLabel.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    init(textAlignment: NSTextAlignment) {
        
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        
        configure()
        
    }
    
    private func configure() {
        
        textColor = .label
        
        adjustsFontSizeToFitWidth = true
        
        minimumScaleFactor = 0.75
        
        lineBreakMode = .byWordWrapping
        
        font = UIFont.preferredFont(forTextStyle: .body)
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
