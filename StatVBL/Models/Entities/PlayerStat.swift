//
//  PlayerStat.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

// MARK: - Эта сущность предназначена для хранения статистики игрока в конкретном матче, поэтому здесь нет таких полей как
// games, pointsPerGame, gamesInStart - все это вычисляемые свойства на основе массива [PlayerStat] - отсюда можно судить, на скольких матчах игрок был в заявке, а также об остальных суммарных показателях, или показателях, основанных на этих суммарных показателях (пр. вычисляемое свойство pointsPerGame)
// pointsPerGame = allPoints([PlayerStat]) / allGames([PlayerStat])

final class PlayerStat: NSObject {
    
    // MARK: - Public properties
    
    var id = 0
    var playerId = 0
    var matchId = 0
    var isGameInStart = false
    var defenseRebounds = 0
    var offenseRebounds = 0
    var assists = 0
    var steals = 0
    var blocks = 0
    var turnovers = 0
    var twoPointsAttempts = 0
    var twoPointsMade = 0
    var threePointsAttempts = 0
    var threePointsMade = 0
    var freeThrowsAttempts = 0
    var freeThrowsMade = 0
    var fouls = 0
    
    var points: Int {
        return freeThrowsMade + twoPointsMade * 2 + threePointsMade * 3
    }
    
    var rebounds: Int {
        return defenseRebounds + offenseRebounds
    }
    
    // MARK: - Private properties
    
    private let storage = Storage()
    
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
        self.isGameInStart = playerStat.isGameInStart
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
