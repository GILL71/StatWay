//
//  PlayerStat.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

final class PlayerStat: NSObject {
    
    var id = 0
    var playerId = 0
    var matchId = 0
    var points: Int {
        return freeThrowsMade + twoPointsMade * 2 + threePointsMade * 3
    }
    var games = 0
    
    private let storage = Storage()
    
    var pointsPerGame: Double {
        return (games != 0 ? Double(points / games) : 0)
    }
    
    var gamesInStart = 0
    
    var pointsPerGameInStart: Double {
        return (gamesInStart != 0 ? Double(points / gamesInStart) : 0)
    }
    
    var defenseRebounds = 0
    
    var defenseReboundsPerGame: Double {
        return games != 0 ? Double(defenseRebounds / games) : 0
    }
    
    var defenseReboundsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(defenseRebounds / gamesInStart) : 0
    }
    
    var offenseRebounds = 0
    
    var offenseReboundsPerGame: Double {
        return games != 0 ? Double(offenseRebounds / games) : 0
    }
    
    var offenseReboundsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(offenseRebounds / gamesInStart) : 0
    }
    
    var rebounds: Int {
        return defenseRebounds + offenseRebounds
    }
    
    var reboundsPerGame: Double {
        return games != 0 ? Double(rebounds / games) : 0
    }
    
    var reboundsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(rebounds / gamesInStart) : 0
    }
    
    var assists = 0
    
    var assistsPerGame: Double {
        return games != 0 ? Double(assists / games) : 0
    }
    
    var assistsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(assists / gamesInStart) : 0
    }
    
    var steals = 0
    
    var stealsPerGame: Double {
        return games != 0 ? Double(steals / games) : 0
    }
    
    var stealsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(steals / gamesInStart) : 0
    }
    
    var blocks = 0
    
    var blocksPerGame: Double {
        return games != 0 ? Double(blocks / games) : 0
    }
    
    var blocksPerGameInStart: Double {
        return gamesInStart != 0 ? Double(blocks / gamesInStart) : 0
    }
    
    var turnovers = 0
    
    var turnoversPerGame: Double {
        return games != 0 ? Double(turnovers / games) : 0
    }
    
    var turnoversPerGameInStart: Double {
        return gamesInStart != 0 ? Double(turnovers / gamesInStart) : 0
    }
    
    var twoPointsAttempts = 0
    
    var twoPointsAttemptsPerGame: Double {
        return games != 0 ? Double(twoPointsAttempts / games) : 0
    }
    
    var twoPointsAttemptsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(twoPointsAttempts / gamesInStart) : 0
    }
    
    var twoPointsMade = 0
    
    var twoPointsMadePerGame: Double {
        return games != 0 ? Double(twoPointsMade / games) : 0
    }
    
    var twoPointsMadePerGameInStart: Double {
        return gamesInStart != 0 ? Double(twoPointsMade / gamesInStart) : 0
    }
    
    var threePointsAttempts = 0
    
    var threePointsAttemptsPerGame: Double {
        return games != 0 ? Double(threePointsAttempts / games) : 0
    }
    
    var threePointsAttemptsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(threePointsAttempts / gamesInStart) : 0
    }
    
    var threePointsMade = 0
    
    var threePointsMadePerGame: Double {
        return games != 0 ? Double(threePointsMade / games) : 0
    }
    
    var threePointsMadePerGameInStart: Double {
        return gamesInStart != 0 ? Double(threePointsMade / gamesInStart) : 0
    }
    
    var freeThrowsAttempts = 0
    
    var freeThrowsAttemptsPerGame: Double {
        return games != 0 ? Double(freeThrowsAttempts / games) : 0
    }
    
    var freeThrowsAttemptsPerGameInStart: Double {
        return gamesInStart != 0 ? Double(freeThrowsAttempts / gamesInStart) : 0
    }
    
    var freeThrowsMade = 0
    
    var freeThrowsMadePerGame: Double {
        return games != 0 ? Double(freeThrowsMade / games) : 0
    }
    
    var freeThrowsMadePerGameInStart: Double {
        return gamesInStart != 0 ? Double(freeThrowsMade / gamesInStart) : 0
    }
    
    var fouls = 0
    
    // MARK: - Initializers
    
    convenience init(playerId: Int) {
        self.init()
        self.playerId = playerId
    }

    convenience init(playerStat: PlayerStatRealm) {
        self.init()
        self.id = playerStat.id
        self.matchId = playerStat.matchId
        self.playerId = playerStat.playerId
        self.games = playerStat.games
        self.gamesInStart = playerStat.gamesInStart
        self.defenseRebounds = playerStat.defenseRebounds
        self.offenseRebounds = playerStat.offenseRebounds
        self.assists = playerStat.assists
        self.steals = playerStat.steals
        self.blocks = playerStat.blocks
        self.turnovers = playerStat.turnovers
        self.twoPointsAttempts = playerStat.twoPointsAttempts
        self.twoPointsMade = playerStat.twoPointsMade
        self.threePointsAttempts = playerStat.threePointsAttempts
        self.threePointsMade = playerStat.threePointsMade
        self.freeThrowsAttempts = playerStat.freeThrowsAttempts
        self.freeThrowsMade = playerStat.freeThrowsMade
        self.fouls = playerStat.fouls
        
    }
    
    func printShortStat() {
        let playerName = storage.getPlayer(by: playerId)?.fullName
        print(playerName ?? "kek")
        let str = """
        Очки - \(points)
        Подборы(А) - \(offenseRebounds)
        Подборы(З) - \(defenseRebounds)
        Передачи - \(assists)
        Перехваты - \(steals)
        Блоки - \(blocks)
        Потери - \(turnovers)
        """
//        print(playerName ?? "" + ":" + str)
        print(str)
    }
    
    func getValue(for statValue: ViewStatValue) -> String {
        switch statValue {
        case .points:
            return "\(points)"
        case .player:
            return ""
        case .rebounds:
            return "\(rebounds)"
        case .offensiveRebounds:
            return "\(offenseRebounds)"
        case .defensiveRebounds:
            return "\(defenseRebounds)"
        case .twoPoints:
            return "\(twoPointsMade)"
        case .twoPointsAttempts:
            return "\(twoPointsAttempts)"
        case .threePoints:
            return "\(threePointsMade)"
        case .threePointsAttempts:
            return "\(threePointsAttempts)"
        case .assists:
            return "\(assists)"
        case .turnovers:
            return "\(turnovers)"
        case .blocks:
            return "\(blocks)"
        case .steals:
            return "\(steals)"
        case .fouls:
            return "\(fouls)"
        }
    }
    
}
