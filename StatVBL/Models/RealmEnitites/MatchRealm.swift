//
//  MatchRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class MatchRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var number = ""
    @objc dynamic var freeThrowsMade = 0
    
    @objc dynamic var fouls = 0
    
    @objc dynamic var plusMinus = 0
    
    @objc dynamic var teamId = 0
    
    convenience init(player: Match) {
        self.init()
        self.id = player.id
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
