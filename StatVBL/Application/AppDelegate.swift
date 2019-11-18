//
//  AppDelegate.swift
//  StatVBL
//
//  Created by Michael Nechaev on 30/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupIQKyeboard()
        initRootViewController()
        return true
    }
    
    private func initRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarScreen()
        window?.makeKeyAndVisible()
    }

}

// MARK: - Setup

private extension AppDelegate {
    
    func setupIQKyeboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 0
    }
    
    func setupTabBar() {
        let tabBarController = self.window?.rootViewController as! UITabBarController
        let nc1 = tabBarController.viewControllers?.first as! UINavigationController
        let vc1 = nc1.viewControllers.first as! GameSetUpViewController
        vc1.configurator = GameSetUpConfigurator()
        
        let nc2 = tabBarController.viewControllers?.last as! UINavigationController
        let vc2 = nc2.viewControllers.last as! CreateTeamViewController
        vc2.configurator = CreateTeamConfigurator()
    }

}
