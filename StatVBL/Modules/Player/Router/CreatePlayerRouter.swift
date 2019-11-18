//
//  CreatePlayerRouter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol CreatePlayerRouterDelegate: Router {
    //func showSmthg()
}

final class CreatePlayerRouter: CreatePlayerRouterDelegate {
    private weak var viewController: CreatePlayerViewController!
    
    required init(viewController: CreatePlayerViewController) {
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
