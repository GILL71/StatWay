//
//  TabItem.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 01/09/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

enum TabItem {
    
    case team
    case game
    
    var name: String {
        switch self {
        case .team:
            return "Team"
        case .game:
            return "Game"
        }
    }
    
    private var imageName: String {
        switch self {
        case .team:
            return "Team"
        case .game:
            return "Game"
        }
    }
    
    var controller: UIViewController {
        switch self {
        case .team:
            let vc = TeamViewController()//.nibInstance() as? CreateTeamViewController else {
//                return UIViewController()
//            }
            vc.configurator = TeamConfigurator()
            return vc
        case .game:
            let vc = GameViewController()//.nibInstance() as? GameSetUpViewController else {
//                return UIViewController()
//            }
            vc.configurator = GameConfigurator()
            return vc
        }
    }
    
    var icon: UIImage? {
        return UIImage(named: "TabBarIcon" + self.imageName)
    }
    
    var iconSelected: UIImage? {
        return UIImage(named: "TabBarIcon" + self.imageName + "Selected")
    }

}
