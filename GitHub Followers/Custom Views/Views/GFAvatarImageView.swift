//
//  GFAvatarImageView.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/6/22.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let emptyPlaceholderImage = UIImage(named: "avatar-placeholder")!
    
    let emptyCacheObject = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    private func configure() {
        
        layer.cornerRadius = 10
        
        clipsToBounds = true
        
        image = emptyPlaceholderImage
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func downloadImage(from urlString: String) {
        
        let cacheNSSKey = NSString(string: urlString)
        
        if let cachedImage = emptyCacheObject.object(forKey: cacheNSSKey) {
            
            self.image = cachedImage
            
            return
            
        }
        
        // Doing network stuff here because we don't need sophisticated error handling via Result enum
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self else { return }
            
            if error != nil { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.emptyCacheObject.setObject(image, forKey: cacheNSSKey)
            
            DispatchQueue.main.async { self.image = image }
            
        }
        
        task.resume()
        
    }

}
