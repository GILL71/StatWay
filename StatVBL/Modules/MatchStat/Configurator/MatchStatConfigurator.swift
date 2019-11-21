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
    
    let id: Int
    
    required init(matchId: Int) {
        id = matchId
    }
    
    func config(viewController: MatchStatViewController) {
        let router = MatchStatRouter(viewController: viewController)
        viewController.presenter = MatchStatPresenter(view: viewController, router: router, matchId: id)
    }
    
}
