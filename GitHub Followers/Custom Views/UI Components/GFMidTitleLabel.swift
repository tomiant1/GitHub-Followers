//
//  GFMidTitleLabel.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/8/22.
//

import UIKit

class GFMidTitleLabel: UILabel {
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    init(fontSize: CGFloat) {
        
        super.init(frame: .zero)
        
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        
        configure()
        
    }
    
    
    private func configure() {
        
        textColor = .label
        
        adjustsFontSizeToFitWidth = true
        
        minimumScaleFactor = 0.90
        
        lineBreakMode = .byTruncatingTail
                
        translatesAutoresizingMaskIntoConstraints = false
        
    }

    
}
