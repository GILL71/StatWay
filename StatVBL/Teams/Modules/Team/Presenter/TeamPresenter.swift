//
//  TeamPresenter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 15/02/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol TeamPresenterDelegate {
    var router: TeamRouterDelegate { get }
    var numberOfSections: Int { get }
    func numberOfRowsIn(_ section: Int) -> Int
    func cellId(forIndexPath: IndexPath) -> String
    func config(cell: UITableViewCell, indexPath: IndexPath)
    func updateSource()
}

final class TeamPresenter: TeamPresenterDelegate {
    
    private weak var view: TeamViewDelegate!
    let router: TeamRouterDelegate
    private var players = [Player]()
    private let storage = Storage()
    
    required init(view: TeamViewDelegate, router: TeamRouterDelegate) {
        self.view = view
        self.router = router
        players = storage.getPlayers()
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsIn(_ section: Int) -> Int {
        return players.count
    }
    
    func cellId(forIndexPath: IndexPath) -> String {
        return PlayerTableViewCell.nameOfClass
    }
    
    func config(cell: UITableViewCell, indexPath: IndexPath) {
        let player = self.players[indexPath.row]
        if let cell = cell as? PlayerTableViewCell {
            cell.numberLabel.text = player.number
            cell.nameLabel.text = player.name
            cell.surnameLabel.text = player.surname
        }
    }

    func updateSource() {
        players = storage.getPlayers()
        view.updateView()
    }

}
