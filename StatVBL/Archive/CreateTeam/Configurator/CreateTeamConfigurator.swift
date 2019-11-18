//
//  CreateTeamConfigurator.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

protocol CreateTeamConfiguratorDelegate {
    func config(viewController: CreateTeamViewController) 
}

final class CreateTeamConfigurator: CreateTeamConfiguratorDelegate {
    
    func config(viewController: CreateTeamViewController) {
        let router = CreateTeamRouter(viewController: viewController)
        viewController.presenter = CreateTeamPresenter(view: viewController, router: router)
        viewController.navigationController?.title = "Состав команды"
    }

}
