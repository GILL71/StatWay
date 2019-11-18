//
//  CreatePlayerConfigurator.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol CreatePlayerConfiguratorDelegate {
    func config(viewController: CreatePlayerViewController)
}

final class CreatePlayerConfigurator: CreatePlayerConfiguratorDelegate {
    
    func config(viewController: CreatePlayerViewController) {
        let router = CreatePlayerRouter(viewController: viewController)
        viewController.presenter = CreatePlayerPresenter(view: viewController, router: router)
        viewController.navigationItem.title = "Новый игрок"
    }

}

