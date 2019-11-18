//
//  CreateTeamRouter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

protocol CreateTeamRouterDelegate: Router {
    //func showSmthg()
}

final class CreateTeamRouter: CreateTeamRouterDelegate {
    private weak var viewController: CreateTeamViewController!
    
    required init(viewController: CreateTeamViewController) {
        self.viewController = viewController
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
