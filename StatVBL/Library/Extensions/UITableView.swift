//
//  UITableView.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

extension UITableView {

    func registerNib(_ cellType: UITableViewCell.Type) {
        register(UINib(nibName: cellType.nameOfClass, bundle: nil), forCellReuseIdentifier: cellType.nameOfClass)
    }

}
