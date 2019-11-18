//
//  GameSetUpRouter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 05/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

protocol GameSetUpRouterDelegate: Router {
//    func performGame(with settings: NumberOfTeams)
}

class GameSetUpRouter: GameSetUpRouterDelegate {
    private weak var viewController: GameSetUpViewController!
    
//    private var settings = NumberOfTeams.One(teamHome: nil, teamAway: nil)
    
    required init(viewController: GameSetUpViewController) {
        self.viewController = viewController
    }
    
//    func performGame(with settings: NumberOfTeams) {
//        self.viewController.performSegue(withIdentifier: self.viewController.selfToGame, sender: nil)
//    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case self.viewController.selfToGame:
                        let vc = segue.destination as! GameViewController
                        vc.configurator = GameConfigurator()//(settings: self.settings)
        default:
            break
        }
    }
}
