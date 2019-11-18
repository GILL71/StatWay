//
//  Router.swift
//  StatVBL
//
//  Created by Michael Nechaev on 30/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

protocol Router {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension Router {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
