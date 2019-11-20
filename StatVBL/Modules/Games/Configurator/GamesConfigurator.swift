//
//  GamesConfigurator.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol GamesConfiguratorDelegate {
    func config(viewController: GamesViewController)
}

final class GamesConfigurator: GamesConfiguratorDelegate {
    
//    var settings = NumberOfTeams.One(teamHome: nil, teamAway: nil)
  
//    required init(settings: NumberOfTeams) {
//        self.settings = settings
//    }
    
    func config(viewController: GamesViewController) {
        let router = GamesRouter(viewController: viewController)
        viewController.presenter = GamesPresenter(view: viewController, router: router)
    }
    
}
