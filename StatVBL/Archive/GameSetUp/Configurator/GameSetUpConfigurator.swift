//
//  GameSetUpConfigurator.swift
//  StatVBL
//
//  Created by Michael Nechaev on 05/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

protocol GameSetUpConfiguratorDelegate {
    func config(viewController: GameSetUpViewController)
}

class GameSetUpConfigurator: GameSetUpConfiguratorDelegate {
    func config(viewController: GameSetUpViewController) {
//        let router = GameSetUpRouter(viewController: viewController)
//        viewController.presenter = GameSetUpPresenter(view: viewController, router: router)
    }
    
}
