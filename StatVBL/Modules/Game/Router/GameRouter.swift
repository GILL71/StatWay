//
//  GameRouter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 30/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol GameRouterDelegate: Router {
    func showSaveGame(with points: Int)
}

final class GameRouter: GameRouterDelegate {
    
    private weak var viewController: GameViewController!
    
    required init(viewController: GameViewController) {
        self.viewController = viewController
    }
    
    func showSaveGame(with points: Int) {
        let saveVC = SaveGameViewController()
        saveVC.configurator = SaveGameConfigurator(saveDelegate: viewController, homeTeamPoints: points, homeTeamName: "Буран")
        viewController.navigationController?.pushViewController(saveVC, animated: true)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        //case self.viewController.selfToSmthg:
//            let vc = segue.destination as! SmthgViewController
//            vc.configurator = SmthgConfigurator(data: names, selectedItem: self.selectedCountry.name ?? "", delegate: self.pickerDelegate)
        default:
            break
        }
    }
}
