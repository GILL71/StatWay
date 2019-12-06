//
//  Match.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

final class Match: NSObject {
    
    // MARK: - Public properties

    var id = 0
    var homeTeamPoints = 0
    var awayTeamPoints = 0
    var homeTeamName = ""
    var awayTeamName = ""
    var date = ""
    var comment: String? = nil
    
    // MARK: - Private properties

    private let storage = Storage()
    
    // MARK: - Initializers

    convenience init(id: Int, hPoints: Int, aPoints: Int, hName: String, aName: String, date: String, comment: String?) throws {
        self.init()
        if hPoints == 0 {
            throw MatchError.NoHomePoints
        }
        if aPoints == 0 {
            throw MatchError.NoAwayPoints
        }
        if hName.isEmpty {
            throw MatchError.NoHomeName
        }
        if aName.isEmpty {
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
    
    convenience init(matchRealm: MatchRealm) {
        self.init()
        self.id = matchRealm.id
        self.homeTeamPoints = matchRealm.homeTeamPoints
        self.awayTeamPoints = matchRealm.awayTeamPoints
        self.homeTeamName = matchRealm.homeTeamName
        self.awayTeamName = matchRealm.awayTeamName
        self.date = matchRealm.date
        self.comment = matchRealm.comment
    }

}
