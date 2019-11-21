//
//  GamesRouter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol GamesRouterDelegate: Router {
    func showStat(for match: Match)
}

final class GamesRouter: GamesRouterDelegate {
    
    private weak var viewController: GamesViewController!
    
    required init(viewController: GamesViewController) {
        self.viewController = viewController
    }
    
    func showStat(for match: Match) {
        let statVC = MatchStatViewController()
        statVC.configurator = MatchStatConfigurator(matchId: match.id)
        viewController.navigationController?.pushViewController(statVC, animated: true)
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
