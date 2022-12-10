//
//  SceneDelegate.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/5/22.
//
// Scene Delegate is now separated from App Deleagate because you can open more windows in the same app so each app can have many scene delegates
// System colors are better because they adjust based on light/dark mode

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        
        window?.rootViewController = createTabBarController()
        
        window?.makeKeyAndVisible()
        
        configureNavbar()
        
    }
    
    func createSearchNavController() -> UINavigationController {
        
        let searchViewController = SearchViewController()
        
        searchViewController.title = "Search"
        
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchViewController)
        
    }
    
    func createFavoritesNavController() -> UINavigationController {
        
        let favoritesNavController = FavoritesViewController()
        
        favoritesNavController.title = "Favorites"
        
        favoritesNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesNavController)
        
    }
    
    func createTabBarController() -> UITabBarController {
        
        let tabBar = UITabBarController()
        
        UITabBar.appearance().tintColor = .systemGreen
        
        UITabBar.appearance().backgroundColor = .systemBackground
        
        tabBar.viewControllers = [createSearchNavController(), createFavoritesNavController()]
        
        return tabBar
        
    }
    
    func configureNavbar() {
        
        UINavigationBar.appearance().tintColor = .systemGreen
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

        
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
        
        
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
        
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
        
        
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
        
        
    }


}

