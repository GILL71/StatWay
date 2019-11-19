//
//  Storage.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import RealmSwift

final class Storage {
    
    private let realm = try! Realm()
    
}

// MARK: - Match

extension Storage {
    
    func save(_ match: Match) {
        let matchRealm = MatchRealm(match: match)
        try! realm.write {
            realm.add(matchRealm)
        }
    }
    
    func generateMatchId() -> Int {
        let matches = realm.objects(MatchRealm.self)
        var matchesIds = [Int]()
        for match in matches {
            matchesIds.append(match.id)
        }
        return (matchesIds.max() ?? 0) + 1
    }
    
    func isExistsMatch(with id: Int) -> Bool {
        if let _ = realm.object(ofType: MatchRealm.self, forPrimaryKey: id) {
            return true
        }
        return false
    }
    
    func getMatches() -> [Match] {
        var matches = [Match]()
        let matchesRealm = realm.objects(MatchRealm.self)
        for matchRealm in matchesRealm {
            let match = Match(matchRealm: matchRealm)
            matches.append(match)
        }
        return matches
    }
    
}

// MARK: - Players

extension Storage {
    
    func delete(_ team: TeamRealm) {
        try! realm.write {
            realm.delete(team)
        }
    }
    
    func add(_ player: Player) {
        let realmPlayer = PlayerRealm(player: player)
        try! realm.write {
            realm.add(realmPlayer)
        }
    }
    
    func getPlayers() -> [Player] {
        var players = [Player]()
        let realmPlayers = realm.objects(PlayerRealm.self)
        for realmPlayer in realmPlayers {
            let player = Player(playerRealm: realmPlayer)
            players.append(player)
        }
        return players
    }
    
    func update(_ player: PlayerRealm, smtng: Int) {
        try! realm.write {
            player.offenseRebounds = smtng
            //            realm.add(player, update: true)
        }
    }
    
    func getPlayer(by id: Int) -> Player? {
        if let playerRealm = self.getPlayerRealm(by: id) {
            return Player(playerRealm: playerRealm)
        }
        return nil
    }
    
    func getPlayerRealm(by id: Int) -> PlayerRealm? {
        return realm.object(ofType: PlayerRealm.self, forPrimaryKey: id)
    }
    
    func generatePlayerId() -> Int {
        let players = realm.objects(PlayerRealm.self)
        var playerIds = [Int]()
        for player in players {
            playerIds.append(player.id)
        }
        return (playerIds.max() ?? 0) + 1
    }
    
    func checkPlayer(withName: String, surname: String) -> Bool {
        let players = realm.objects(PlayerRealm.self)
        for player in players {
            if player.name == withName && player.surname == surname {
                return true
            }
        }
        return false
    }
    
    func checkPlayer(number: String) -> Bool {
        let players = realm.objects(PlayerRealm.self)
        for player in players {
            if player.number == number {
                return true
            }
        }
        return false
    }
    
}

// MARK: - Stat

extension Storage {
    
    func generateStatId() -> Int {
        let playerStats = realm.objects(PlayerStatRealm.self)
        var playerStatIds = [Int]()
        for playerStat in playerStats {
            playerStatIds.append(playerStat.id)
        }
        return (playerStatIds.max() ?? 0) + 1
    }
    
    func save(_ stat: PlayerStat) {
        stat.id = generateStatId()
        let realmStat = PlayerStatRealm(stat: stat)
        try! realm.write {
            realm.add(realmStat)
        }
    }
    
    func getStats(for matchId: Int) -> [PlayerStat] {
        var playerStats = [PlayerStat]()
        let playerStatsRealm = realm.objects(PlayerStatRealm.self).filter("matchId == \(matchId)")
        for statRealm in playerStatsRealm {
            let stat = PlayerStat(playerStat: statRealm)
            playerStats.append(stat)
        }
        return playerStats
    }

}

// MARK: - Teams

extension Storage {
    
//    func getTeam(by id: Int) -> Team? {
//        //        if let teamRealm = self.getTeamRealm(by: id) {
//        //            return Team(with: teamRealm)
//        //        }
//        return nil
//    }
    
    func getTeamRealm(by id: Int) -> TeamRealm? {
        return realm.object(ofType: TeamRealm.self, forPrimaryKey: id)
    }
    
    //    func generateTeamId() ->   {
    //        let teams = realm.objects(TeamRealm.self)
    //        var teamIds = [Int]()
    //        for team in teams {
    //            teamIds.append(team.id)
    //        }
    //        return teamIds.max() ?? 1
    //    }

    func checkTeam(with name: String) -> Bool {
        let teams = realm.objects(TeamRealm.self)
        for team in teams {
            if team.name == name {
                return true
            }
        }
        return false
    }
    
}

// MARK: - Utilities

extension Storage {

    func cleanDB() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }

}
