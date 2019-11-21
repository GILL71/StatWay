//
//  PlayerStatTableViewCell.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class PlayerStatTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    
    func setup(with player: Player) {
        nameLabel.text = player.name
        surnameLabel.text = player.surname
    }

}
