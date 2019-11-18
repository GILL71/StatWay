//
//  Match.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

class Match: NSObject {
    var id = ""
    
    var homeTeam = Team()
    var awayTeam = Team()
    
    var homeTeamPlayersMasks = [Player]()
    var awayTeamPlayersMasks = [Player]()
    
    private let storage = Storage()
    
    //for match creation
    convenience init(homeId: Int, awayId: Int) {
        self.init()
        
        self.id = dateFormatter.string(from: Date()) + "+\(homeId)" + "+\(awayId)"
        
        if let hT = self.storage.getTeam(by: homeId) {
            self.homeTeam = hT
        }
        if let aT = self.storage.getTeam(by: awayId) {
            self.awayTeam = aT
        }
        for playerH in self.homeTeam.roster {
            let player = playerH
            player.id = playerH.id + ":" + self.id
            self.homeTeamPlayersMasks.append(player)
        }
        for playerA in self.awayTeam.roster {
            let player = playerA
            player.id = playerA.id + ":" + self.id
            self.awayTeamPlayersMasks.append(player)
        }
    }
    
    //for watching match stat
    convenience init(with matchRealm: MatchRealm) {
        self.init()
        self.id = matchRealm.id
        
        if let hT = self.storage.getTeam(by: matchRealm.homeTeamId) {
            self.homeTeam = hT
        }
        if let aT = self.storage.getTeam(by: matchRealm.awayTeamId) {
            self.awayTeam = aT
        }
        
        for playerId in matchRealm.homeTeamRosterIds {
            if let player = self.storage.getPlayer(by: playerId) {
                self.homeTeamPlayersMasks.append(player)
            }
        }
        for playerId in matchRealm.awayTeamRosterIds {
            if let player = self.storage.getPlayer(by: playerId) {
                self.awayTeamPlayersMasks.append(player)
            }
        }
    }
}
