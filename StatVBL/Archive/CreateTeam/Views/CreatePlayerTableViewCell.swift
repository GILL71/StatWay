//
//  CreatePlayerTableViewCell.swift
//  StatVBL
//
//  Created by Michael Nechaev on 01/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

class CreatePlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var onCreateButtonTapped : (() -> Void)? = nil

    @IBAction func createButtonTapped(_ sender: Any) {
        guard let createAction = onCreateButtonTapped else {
            return
        }
        createAction()
    }
}
