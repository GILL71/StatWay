//
//  PlayerRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class PlayerRealm: Object {
    
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
    
    convenience init(player: Player) {
        self.init()
        self.id = player.id
        self.name = player.name
        self.surname = player.surname
        self.number = player.number
//        self.points = player.points
//        self.games = player.games
//        self.gamesInStart = player.gamesInStart
//        self.defenseRebounds = player.defenseRebounds
//        self.offenseRebounds = player.offenseRebounds
//        self.assists = player.assists
//        self.steals = player.steals
//        self.blocks = player.blocks
//        self.turnovers = player.turnovers
//        self.fieldGoalsAttempts = player.fieldGoalsAttempts
//        self.fieldGoalsMade = player.fieldGoalsMade
//        self.threePointsAttempts = player.threePointsAttempts
//        self.threePointsMade = player.threePointsMade
//        self.freeThrowsAttempts = player.freeThrowsAttempts
//        self.freeThrowsMade = player.freeThrowsMade
//        self.fouls = player.fouls
//        self.plusMinus = player.plusMinus
        self.teamId = player.teamId
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }

}
