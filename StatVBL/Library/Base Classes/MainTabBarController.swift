//
//  MainTabBarController.swift
//  StatVBL
//
//  Created by Michael Nechaev on 26/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = GameSetUpViewController()
        firstViewController.configurator = GameSetUpConfigurator()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let secondViewController = CreateTeamViewController()
        secondViewController.configurator = CreateTeamConfigurator()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList
    }

}
