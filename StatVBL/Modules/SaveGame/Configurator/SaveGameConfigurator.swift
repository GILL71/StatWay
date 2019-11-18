//
//  SaveGameConfigurator.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 09.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol SaveGameConfiguratorDelegate {
    func config(viewController: SaveGameViewController)
}

final class SaveGameConfigurator: SaveGameConfiguratorDelegate {
    
    private let homeTeamPoints: Int
    private let homeTeamName: String
    private weak var saveDelegate: SaveGameDelegate?

    init(saveDelegate: SaveGameDelegate, homeTeamPoints: Int, homeTeamName: String) {
        self.homeTeamName = homeTeamName
        self.homeTeamPoints = homeTeamPoints
        self.saveDelegate = saveDelegate
    }
    
    func config(viewController: SaveGameViewController) {
        let router = SaveGameRouter(viewController: viewController)
        viewController.presenter = SaveGamePresenter(view: viewController, router: router, homeTeamPoints: homeTeamPoints, homeTeamName: homeTeamName, saveDelegate: saveDelegate)
    }
    
}
