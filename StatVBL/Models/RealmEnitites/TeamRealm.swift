//
//  TeamRealm.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class TeamRealm: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    var rosterIds = List<String>()
    
    override class func primaryKey() -> String? {
        return "id"
    }

}
