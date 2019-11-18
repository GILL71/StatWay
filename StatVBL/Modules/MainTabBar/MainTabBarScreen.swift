//
//  MainTabBarScreen.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 01/09/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class MainTabBarScreen: UITabBarController {
    
    // MARK: - Class Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTabs()
    }

}

// MARK: - Configure

private extension MainTabBarScreen {
    
    private func setupUI() {
        tabBar.tintColor = .blue
    }
    
    private func loadTabs() {
        let tabs: [TabItem] = [.team, .game]
        viewControllers = tabs.map { tab in
            let vc = tab.controller
            let wrapedVC = UINavigationController(rootViewController: vc)
            vc.tabBarItem = UITabBarItem(title: tab.name, image: tab.icon, selectedImage: tab.iconSelected)
            return wrapedVC
        }
    }

}
