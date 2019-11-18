//
//  GameConfigurator.swift
//  StatVBL
//
//  Created by Michael Nechaev on 30/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

protocol GameConfiguratorDelegate {
    func config(viewController: GameViewController)
}

final class GameConfigurator: GameConfiguratorDelegate {
    
//    var settings = NumberOfTeams.One(teamHome: nil, teamAway: nil)
  
//    required init(settings: NumberOfTeams) {
//        self.settings = settings
//    }
    
    func config(viewController: GameViewController) {
        let router = GameRouter(viewController: viewController)
        viewController.presenter = GamePresenter(view: viewController, router: router)
    }
    
}
