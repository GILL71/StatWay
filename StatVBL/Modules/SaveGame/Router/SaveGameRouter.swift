//
//  SaveGameRouter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 09.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol SaveGameRouterDelegate: Router {
    //func showSmthg()
}

final class SaveGameRouter: SaveGameRouterDelegate {
    
    private weak var viewController: SaveGameViewController!
    
    required init(viewController: SaveGameViewController) {
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
