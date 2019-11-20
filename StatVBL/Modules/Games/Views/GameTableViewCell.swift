//
//  GameTableViewCell.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class GameTableViewCell: UITableViewCell {

    @IBOutlet private weak var homeTeamNameLabel: UILabel!
    @IBOutlet private weak var awayTeamNameLabel: UILabel!
    @IBOutlet private weak var homeTeamPointsLabel: UILabel!
    @IBOutlet private weak var awayTeamPointsLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func setup(with game: Match) {
        homeTeamNameLabel.text = game.homeTeamName
        awayTeamNameLabel.text = game.awayTeamName
        homeTeamPointsLabel.text = "\(game.homeTeamPoints)"
        awayTeamPointsLabel.text = "\(game.awayTeamPoints)"
        dateLabel.text = game.date
        separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

}
