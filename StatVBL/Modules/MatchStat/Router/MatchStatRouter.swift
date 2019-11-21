//
//  MatchStatRouter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol MatchStatRouterDelegate: Router {
    func showMoreStat(for player: Player)
}

final class MatchStatRouter: MatchStatRouterDelegate {
    
    private weak var viewController: MatchStatViewController!
    
    required init(viewController: MatchStatViewController) {
        self.viewController = viewController
    }
    
    func showMoreStat(for player: Player) {
//        let saveVC = SavesGameViewController()
//        saveVC.configurator = SaveGameConfigurator(saveDelegate: viewController, homeTeamPoints: 15, homeTeamName: "Буран")
//        viewController.navigationController?.pushViewController(saveVC, animated: true)
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
