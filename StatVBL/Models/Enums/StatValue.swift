//
//  StatValue.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 01.12.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

enum StatValue {
    case onePoint
    case missedOneP
    case twoPoints
    case missedTwoP
    case threePoints
    case missedThreeP
    case offensiveRebound
    case defensiveRebound
    case assist
    case turnover
    case block
    case steal
    case foul
}

enum ViewStatValue: String {
    case player = "Player"
    case points = "PTS"
    case rebounds = "REB"
    case offensiveRebounds = "OR"
    case defensiveRebounds = "DR"
    case twoPoints = "2P"
    case twoPointsAttempts = "2PA"
    case threePoints = "3P"
    case threePointsAttempts = "3PA"
    case assists = "AST"
    case turnovers = "TO"
    case blocks = "BLK"
    case steals = "STL"
    case fouls = "FL"
}
