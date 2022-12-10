//
//  FavoritesListViewController.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    
    let tableView = UITableView()
    
    var favorites: [Follower] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureViewController()
        
        configureTableView()
        
        getFavorites()
        
    }
    
    // Refresh favorites view controller also when tabs are switched, because viewDidLoad can only be called once.
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        getFavorites()
        
    }
    
    
    func configureViewController() {
        
        view.backgroundColor = .systemPink
        
        title = "Favorites"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    func configureTableView() {
        
        view.addSubview(tableView)
        
        tableView.frame = view.bounds

        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.rowHeight = 80
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseIdentifier)
        
    }
    
    
    func getFavorites() {
        
        PersistenceManager.retrieveFavorites { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let favorites):
                
                if favorites.isEmpty {
                    
                    self.showEmptyStateView(with: "No favorites yet...", in: self.view)
                    
                } else {
                    
                    self.favorites = favorites
                    
                    DispatchQueue.main.async {
                        
                        self.tableView.reloadData()
                        
                        self.view.bringSubviewToFront(self.tableView)
                        
                    }
                    
                }
                
            case .failure(let error):
                
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                
            }
            
        }
        
    }

}


extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favorites.count
            
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseIdentifier) as! FavoriteCell
        
        let favorite = favorites[indexPath.row]
        
        cell.populateCellWithData(favorite: favorite)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let favoriteCell = favorites[indexPath.row]
        
        let destinationViewController = FollowersViewController()
        
        destinationViewController.username = favoriteCell.login
        
        destinationViewController.title = favoriteCell.login
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        
        favorites.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        PersistenceManager.updateFavorites(favorite: favorite, actionType: .remove) { [weak self] error in
            
            guard let self = self else { return }
            
            guard let error = error else { return }
            
            self.presentGFAlertOnMainThread(title: "Cannot remove favorite", message: error.rawValue, buttonTitle: "OK")
            
        }
        
    }
    
    
}
