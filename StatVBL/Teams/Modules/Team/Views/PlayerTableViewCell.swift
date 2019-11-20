//
//  PlayerTableViewCell.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class PlayerTableViewCell: UITableViewCell {

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func setup(with player: Player) {
        numberLabel.text = player.number
        nameLabel.text = player.name
        surnameLabel.text = player.surname
    }

}
