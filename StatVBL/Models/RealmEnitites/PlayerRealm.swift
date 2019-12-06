//
//  PlayerRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class PlayerRealm: Object {
    
    // MARK: - Public properties

    @objc dynamic var id = 0
    @objc dynamic var number = ""
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var points = 0
    @objc dynamic var games = 0
    @objc dynamic var gamesInStart = 0
    @objc dynamic var defenseRebounds = 0
    @objc dynamic var offenseRebounds = 0
    @objc dynamic var assists = 0
    @objc dynamic var steals = 0
    @objc dynamic var blocks = 0
    @objc dynamic var turnovers = 0
    @objc dynamic var fieldGoalsAttempts = 0
    @objc dynamic var fieldGoalsMade = 0
    @objc dynamic var threePointsAttempts = 0
    @objc dynamic var threePointsMade = 0
    @objc dynamic var freeThrowsAttempts = 0
    @objc dynamic var freeThrowsMade = 0
    @objc dynamic var fouls = 0
    @objc dynamic var plusMinus = 0
    @objc dynamic var teamId = 0
    
    // MARK: - Initializers

    convenience init(player: Player) {
        self.init()
        self.id = player.id
        self.name = player.name
        self.surname = player.surname
        self.number = player.number
        self.teamId = player.teamId
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }

}
