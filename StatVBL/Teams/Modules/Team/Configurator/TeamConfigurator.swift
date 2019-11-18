//
//  TeamConfigurator.swift
//  StatVBL
//
//  Created by Michael Nechaev on 15/02/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol TeamConfiguratorDelegate {
    func config(viewController: TeamViewController)
}

class TeamConfigurator: TeamConfiguratorDelegate {
    func config(viewController: TeamViewController) {
        let router = TeamRouter(viewController: viewController)
        viewController.presenter = TeamPresenter(view: viewController, router: router)
    }
    
}
