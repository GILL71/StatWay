//
//  MatchStatConfigurator.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol MatchStatConfiguratorDelegate {
    func config(viewController: MatchStatViewController)
}

final class MatchStatConfigurator: MatchStatConfiguratorDelegate {
    
//    var settings = NumberOfTeams.One(teamHome: nil, teamAway: nil)
  
//    required init(settings: NumberOfTeams) {
//        self.settings = settings
//    }
    
    func config(viewController: MatchStatViewController) {
        let router = MatchStatRouter(viewController: viewController)
        viewController.presenter = MatchStatPresenter(view: viewController, router: router)
    }
    
}
