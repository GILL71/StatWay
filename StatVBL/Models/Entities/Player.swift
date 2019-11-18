//
//  Player.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

final class Player: NSObject {
    
    var id = 0
    var number = ""
    var name = ""
    var surname = ""
//    var points = 0
//    var games = 0
    
    private let storage = Storage()
    
    var fullName: String {
        return name + " " + surname
    }
    
//    var pointsPerGame: Double {
//        return (games != 0 ? Double(points / games) : 0)
//    }
//    
//    var gamesInStart = 0
//    
//    var pointsPerGameInStart: Double {
//        return (gamesInStart != 0 ? Double(points / gamesInStart) : 0)
//    }
//    
//    var defenseRebounds = 0
//    
//    var defenseReboundsPerGame: Double {
//        return games != 0 ? Double(defenseRebounds / games) : 0
//    }
//    
//    var defenseReboundsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(defenseRebounds / gamesInStart) : 0
//    }
//    
//    var offenseRebounds = 0
//    
//    var offenseReboundsPerGame: Double {
//        return games != 0 ? Double(offenseRebounds / games) : 0
//    }
//    
//    var offenseReboundsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(offenseRebounds / gamesInStart) : 0
//    }
//    
//    var rebounds: Int {
//        return defenseRebounds + offenseRebounds
//    }
//    
//    var reboundsPerGame: Double {
//        return games != 0 ? Double(rebounds / games) : 0
//    }
//    
//    var reboundsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(rebounds / gamesInStart) : 0
//    }
//    
//    var assists = 0
//    
//    var assistsPerGame: Double {
//        return games != 0 ? Double(assists / games) : 0
//    }
//    
//    var assistsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(assists / gamesInStart) : 0
//    }
//    
//    var steals = 0
//    
//    var stealsPerGame: Double {
//        return games != 0 ? Double(steals / games) : 0
//    }
//    
//    var stealsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(steals / gamesInStart) : 0
//    }
//    
//    var blocks = 0
//    
//    var blocksPerGame: Double {
//        return games != 0 ? Double(blocks / games) : 0
//    }
//    
//    var blocksPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(blocks / gamesInStart) : 0
//    }
//    
//    var turnovers = 0
//    
//    var turnoversPerGame: Double {
//        return games != 0 ? Double(turnovers / games) : 0
//    }
//    
//    var turnoversPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(turnovers / gamesInStart) : 0
//    }
//    
//    var fieldGoalsAttempts = 0
//    
//    var fieldGoalsAttemptsPerGame: Double {
//        return games != 0 ? Double(fieldGoalsAttempts / games) : 0
//    }
//    
//    var fieldGoalsAttemptsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(fieldGoalsAttempts / gamesInStart) : 0
//    }
//    
//    var fieldGoalsMade = 0
//    
//    var fieldGoalsMadePerGame: Double {
//        return games != 0 ? Double(fieldGoalsMade / games) : 0
//    }
//    
//    var fieldGoalsMadePerGameInStart: Double {
//        return gamesInStart != 0 ? Double(fieldGoalsMade / gamesInStart) : 0
//    }
//    
//    var threePointsAttempts = 0
//    
//    var threePointsAttemptsPerGame: Double {
//        return games != 0 ? Double(threePointsAttempts / games) : 0
//    }
//    
//    var threePointsAttemptsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(threePointsAttempts / gamesInStart) : 0
//    }
//    
//    var threePointsMade = 0
//    
//    var threePointsMadePerGame: Double {
//        return games != 0 ? Double(threePointsMade / games) : 0
//    }
//    
//    var threePointsMadePerGameInStart: Double {
//        return gamesInStart != 0 ? Double(threePointsMade / gamesInStart) : 0
//    }
//    
//    var freeThrowsAttempts = 0
//    
//    var freeThrowsAttemptsPerGame: Double {
//        return games != 0 ? Double(freeThrowsAttempts / games) : 0
//    }
//    
//    var freeThrowsAttemptsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(freeThrowsAttempts / gamesInStart) : 0
//    }
//    
//    var freeThrowsMade = 0
//    
//    var freeThrowsMadePerGame: Double {
//        return games != 0 ? Double(freeThrowsMade / games) : 0
//    }
//    
//    var freeThrowsMadePerGameInStart: Double {
//        return gamesInStart != 0 ? Double(freeThrowsMade / gamesInStart) : 0
//    }
//    
//    var fouls = 0
//    
//    var foulsPerGame: Double {
//        return games != 0 ? Double(fouls / games) : 0
//    }
//    
//    var foulsPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(fouls / gamesInStart) : 0
//    }
//    
//    var plusMinus = 0
//    
//    var plusMinusPerGame: Double {
//        return games != 0 ? Double(plusMinus / games) : 0
//    }
//    
//    var plusMinusPerGameInStart: Double {
//        return gamesInStart != 0 ? Double(plusMinus / gamesInStart) : 0
//    }
//    
    var teamId = 0
    
    convenience init(name: String, surname: String, number: String) throws {
        self.init()
        if name.isEmpty {
            throw PlayerError.NoName
        }
        if surname.isEmpty {
            throw PlayerError.NoSurname
        }
        if number.isEmpty {
            throw PlayerError.NoNumber
        }
//        if name.rangeOfCharacter(from: russianLetters) == nil {
//            throw NameError.InvalidName
//        }
        if self.storage.checkPlayer(withName: name, surname: surname) {
            throw PlayerError.ExistingName
        }
        if self.storage.checkPlayer(number: number) {
            throw PlayerError.ExistingNumber
        }
        self.id = self.storage.generatePlayerId()//self.storage.generateId(for: PlayerRealm)
        self.name = name
        self.surname = surname
        self.number = number
    }
    
    convenience init(playerRealm: PlayerRealm) {
        self.init()
        self.id = playerRealm.id
        self.name = playerRealm.name
        self.surname = playerRealm.surname
        self.number = playerRealm.number
//        self.points = playerRealm.points
//        self.games = playerRealm.games
//        self.gamesInStart = playerRealm.gamesInStart
//        self.defenseRebounds = playerRealm.defenseRebounds
//        self.offenseRebounds = playerRealm.offenseRebounds
//        self.assists = playerRealm.assists
//        self.steals = playerRealm.steals
//        self.blocks = playerRealm.blocks
//        self.turnovers = playerRealm.turnovers
//        self.fieldGoalsAttempts = playerRealm.fieldGoalsAttempts
//        self.fieldGoalsMade = playerRealm.fieldGoalsMade
//        self.threePointsAttempts = playerRealm.threePointsAttempts
//        self.threePointsMade = playerRealm.threePointsMade
//        self.freeThrowsAttempts = playerRealm.freeThrowsAttempts
//        self.freeThrowsMade = playerRealm.freeThrowsMade
//        self.fouls = playerRealm.fouls
//        self.plusMinus = playerRealm.plusMinus
        self.teamId = playerRealm.teamId
    }
    
//    func printShortStat() {
//        let str = """
//            Очки - \(points)
//            Подборы(А) - \(offenseRebounds)
//            Подборы(З) - \(defenseRebounds)
//            Передачи - \(assists)
//            Перехваты - \(steals)
//            Блоки - \(blocks)
//            Потери - \(turnovers)
//        """
//        print(str)
//    }
    
    
}


