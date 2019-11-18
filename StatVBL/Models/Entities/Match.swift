//
//  Match.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

final class Match: NSObject {
    
    var id = 0
    var homeTeamPoints = 0
    var awayTeamPoints = 0
    var homeTeamName = ""
    var awayTeamName = ""
    var date = ""
    var comment: String? = nil
    
    private let storage = Storage()
    
    convenience init(id: Int, hPoints: Int, aPoints: Int, hName: String, aName: String, date: String, comment: String?) throws {
        self.init()
        if homeTeamPoints == 0 {
            throw MatchError.NoHomePoints
        }
        if awayTeamPoints == 0 {
            throw MatchError.NoAwayPoints
        }
        if homeTeamName.isEmpty {
            throw MatchError.NoHomeName
        }
        if awayTeamName.isEmpty {
            throw MatchError.NoAwayName
        }
        if date.isEmpty {
            throw MatchError.NoDate
        }
        if storage.isExistsMatch(with: id) {
            throw MatchError.NonUniqueId
        }
        self.id = id
        self.homeTeamPoints = hPoints
        self.awayTeamPoints = aPoints
        self.homeTeamName = hName
        self.awayTeamName = aName
        self.date = date
        self.comment = comment
        
    }
    
}
