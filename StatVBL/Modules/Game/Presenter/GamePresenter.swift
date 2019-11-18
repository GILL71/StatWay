//
//  GamePresenter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 30/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

enum AddPlayerStat {
    case points(num: Int)
    case ofRebound
    case defRebound
    case assist
    case turnover
    case block
    case steal
}

protocol GamePresenterDelegate {
    var router: GameRouterDelegate { get }
    var bundleAdapter: BundleAdapter? { get }
    var startingFiveAdapter: StartingFiveAdapter? { get }
    var playerFromStartForSubstitution: PlayerStat? { get }
    var playerFromBundleForSubstitution: PlayerStat? { get }
    func setupAdapters()
    func countSelectedPlayer(stat: AddPlayerStat)
    func makeSubstitution(of player: PlayerStat)
    func confirmSubstitution(on player: PlayerStat)
    func completeSubstitution()
    func cancelSubstitution()
    func updateStartList()
    func updateBundleList()
    func saveStats(for matchId: Int)
}

// Во время матча презентер оперирует только данными статистики
// Инициализируется презентер с помощью Player 's
// А работу ведет с PlayerStat
// Которая прикрепляется к каждому участнику матча

final class GamePresenter: GamePresenterDelegate {
    
    let router: GameRouterDelegate
    var bundleAdapter: BundleAdapter?
    var startingFiveAdapter: StartingFiveAdapter?
    var playerFromStartForSubstitution: PlayerStat?
    var playerFromBundleForSubstitution: PlayerStat?

    private weak var view: GameViewDelegate!
    private var homeTeam = [Player]()
    
    private let storage = Storage()

    
    init(view: GameViewDelegate, router: GameRouterDelegate) {
        self.view = view
        self.router = router
        homeTeam = storage.getPlayers()
    }
    
    func setupAdapters() {
        var five: [Player]
        if homeTeam.count < 5 {
            five = [Player]()
        } else {
            five = [homeTeam[0], homeTeam[1], homeTeam[2], homeTeam[3], homeTeam[4]]
        }
        startingFiveAdapter = StartingFiveAdapter(startingFive: five, presenter: self)
        var bundle = [Player]()
        for player in homeTeam {
            if !five.contains(player) {
                bundle.append(player)
            }
        }
        bundleAdapter = BundleAdapter(bundleSet: bundle, presenter: self)
    }
    
    func countSelectedPlayer(stat: AddPlayerStat) {
        if let playerStat = startingFiveAdapter?.activePlayer {
            switch stat {
            case let .points(num):
                playerStat.points += num
            case .assist:
                playerStat.assists += 1
            case .ofRebound:
                playerStat.offenseRebounds += 1
            case .turnover:
                playerStat.turnovers += 1
            case .block:
                playerStat.blocks += 1
            case .defRebound:
                playerStat.defenseRebounds += 1
            case .steal:
                playerStat.steals += 1
            }
            view?.deselectStartPlayer(at: IndexPath(row: startingFiveAdapter?.indexOfActivePlayer ?? 0, section: 0))
            startingFiveAdapter?.activePlayer = nil
        } else {
            view?.showTapTip()
        }
    }
    
    func makeSubstitution(of player: PlayerStat) {
        playerFromStartForSubstitution = player
        view?.showBundle()
    }
    
    func confirmSubstitution(on player: PlayerStat) {
        playerFromBundleForSubstitution = player
        guard let startPlayerStat = playerFromStartForSubstitution else {
            return
        }
        guard let bundlePlayerStat = playerFromBundleForSubstitution else {
            return
        }
        guard let playerStart = storage.getPlayer(by: startPlayerStat.playerId) else {
            return
        }
        guard let playerBundle = storage.getPlayer(by: bundlePlayerStat.playerId) else {
            return
        }
        view?.showSubstitutionAlert(for: playerStart.fullName, on: playerBundle.fullName)
    }
    
    func completeSubstitution() {
        if let startPlayer = playerFromStartForSubstitution, let bundlePlayer = playerFromBundleForSubstitution {
            startingFiveAdapter?.makeSubstitution(with: bundlePlayer)
            bundleAdapter?.makeSubstitution(with: startPlayer)
        }
    }
    
    func cancelSubstitution() {
        playerFromStartForSubstitution = nil
        playerFromBundleForSubstitution = nil
    }
    
    func updateStartList() {
        view?.reloadStart()
    }
    
    func updateBundleList() {
        view?.reloadBundle()
    }

    func saveStats(for matchId: Int) {
        bundleAdapter?.savePlayersStats(for: matchId)
        startingFiveAdapter?.savePlayersStats(for: matchId)
    }

}
