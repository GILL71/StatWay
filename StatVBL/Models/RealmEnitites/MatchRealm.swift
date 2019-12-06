//
//  MatchRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class MatchRealm: Object {
    
    // MARK: - Public properties
    
    @objc dynamic var id = 0
    @objc dynamic var homeTeamPoints = 0
    @objc dynamic var awayTeamPoints = 0
    @objc dynamic var homeTeamName = ""
    @objc dynamic var awayTeamName = ""
    @objc dynamic var date = ""
    @objc dynamic var comment: String? = nil
    
    // MARK: - Initializers

    convenience init(match: Match) {
        self.init()
        self.id = match.id
        self.homeTeamPoints = match.homeTeamPoints
        self.awayTeamPoints = match.awayTeamPoints
        self.homeTeamName = match.homeTeamName
        self.awayTeamName = match.awayTeamName
        self.date = match.date
        self.comment = match.comment
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
