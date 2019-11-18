//
//  TeamRouter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 15/02/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol TeamRouterDelegate: Router {
    func showCreatePlayer()
}

final class TeamRouter: TeamRouterDelegate {
    private weak var viewController: TeamViewController!
    
    required init(viewController: TeamViewController) {
        self.viewController = viewController
    }
    
    func showCreatePlayer() {
        let createVC = CreatePlayerViewController()
        createVC.configurator = CreatePlayerConfigurator()
        createVC.delegate = viewController
        viewController.navigationController?.pushViewController(createVC, animated: true)
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
