//
//  TabBarViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // MARK: - Variable
    private var coordinator: Coordinator
    
    // MARK: - UI Components
    
    // MARK: - Init
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: - UI Setup
    private func setupTabBar() {
        view.backgroundColor = .systemBackground
        
        let vc1 = HomeViewBuilder.build(coordinator: coordinator)
        let vc2 = LibraryViewBuilder.build(coordinator: coordinator)
        let vc3 = WhatchlistViewBuilder.build(coordinator: coordinator)
        let vc4 = ProfileViewBuilder.build(coordinator: coordinator)
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        nav2.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "books.vertical"), selectedImage: UIImage(systemName: "books.vertical.fill"))
        nav3.tabBarItem = UITabBarItem(title: "Whatchlist", image: UIImage(systemName: "play.tv"), selectedImage: UIImage(systemName: "play.tv.fill"))
        nav4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        tabBar.tintColor = .systemRed
        tabBar.unselectedItemTintColor = .systemGray
        setViewControllers([nav1, nav3, nav2, nav4], animated: true)
        
    }
    
}

// MARK: - Extension
