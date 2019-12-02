//
//  PlayerStatRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class PlayerStatRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var playerId = 0
    @objc dynamic var matchId = 0
    @objc dynamic var points = 0
    @objc dynamic var games = 0
    @objc dynamic var gamesInStart = 0
    @objc dynamic var defenseRebounds = 0
    @objc dynamic var offenseRebounds = 0
    @objc dynamic var assists = 0
    @objc dynamic var steals = 0
    @objc dynamic var blocks = 0
    @objc dynamic var turnovers = 0
    @objc dynamic var twoPointsAttempts = 0
    @objc dynamic var twoPointsMade = 0
    @objc dynamic var threePointsAttempts = 0
    @objc dynamic var threePointsMade = 0
    @objc dynamic var freeThrowsAttempts = 0
    @objc dynamic var freeThrowsMade = 0
    @objc dynamic var fouls = 0
    
    convenience init(stat: PlayerStat) {
        self.init()
        self.id = stat.id
        self.matchId = stat.matchId
        self.playerId = stat.playerId
        self.points = stat.points
        self.games = stat.games
        self.gamesInStart = stat.gamesInStart
        self.defenseRebounds = stat.defenseRebounds
        self.offenseRebounds = stat.offenseRebounds
        self.assists = stat.assists
        self.steals = stat.steals
        self.blocks = stat.blocks
        self.turnovers = stat.turnovers
        self.twoPointsAttempts = stat.twoPointsAttempts
        self.twoPointsMade = stat.twoPointsMade
        self.threePointsAttempts = stat.threePointsAttempts
        self.threePointsMade = stat.threePointsMade
        self.freeThrowsAttempts = stat.freeThrowsAttempts
        self.freeThrowsMade = stat.freeThrowsMade
        self.fouls = stat.fouls
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }

}

