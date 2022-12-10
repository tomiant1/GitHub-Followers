//
//  PersistenceManager.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/9/22.
//
// using enum instead of struct because with enum you cannot create an instance; minor difference not super important here but just a note;

import Foundation


enum PersistenceActionType { case add, remove }

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        
        static let favorites = "favorites"
        
    }
    
    
    static func updateFavorites(favorite: Follower, actionType: PersistenceActionType, completion: @escaping (ErrorCase?) -> Void) {
        
        retrieveFavorites { result in
            
            switch result {
                
            case .success(let favorites):
                
                var retrievedFavorites = favorites
                
                switch actionType {
                    
                case .add:
                    
                    guard !retrievedFavorites.contains(favorite) else {
                        
                        completion(.alreadyInFavorites)
                        
                        return
                        
                    }
                    
                    retrievedFavorites.append(favorite)
                    
                case .remove:
                    
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                    
                }
                
                completion(save(favorites: retrievedFavorites))
            
            case .failure(let error):
                
                completion(error)
                
            }
            
        }
        
        
    }
    
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], ErrorCase>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            
            completed(.success([]))
            
            return
            
        }
        
        do {
            
            let decoder = JSONDecoder()
                        
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            
            completed(.success(favorites))
            
        } catch {
            
            completed(.failure(.unableToFavorite))
            
        }
        
    }
    
    static func save(favorites: [Follower]) -> ErrorCase? {
        
        do {
            
            let encoder = JSONEncoder()
            
            let encodedFavorites = try encoder.encode(favorites)
            
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            
            return nil
            
        } catch {
            
            return .unableToFavorite
            
        }
        
    }
    
}
