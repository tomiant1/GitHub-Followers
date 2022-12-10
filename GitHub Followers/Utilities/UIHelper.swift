//
//  UIHelper.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/7/22.
//

import UIKit


struct UIHelper {
    
    
    static func createThreeColumnLayout(in view: UIView) -> UICollectionViewFlowLayout {
                
        let width = view.bounds.width
        
        let padding: CGFloat = 12
        
        let minItemSpacing: CGFloat = 10
        
        let availableWidth = width - (padding * 2) - (minItemSpacing * 2)
        
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
        
        
    }
    
    
}
