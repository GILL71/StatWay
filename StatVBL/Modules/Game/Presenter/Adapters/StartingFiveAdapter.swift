//
//  StartingFiveAdapter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 02.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class StartingFiveAdapter: NSObject {

    var activePlayer: PlayerStat?
    var overAllPoints: Int {
        var points = 0
        for stat in startingFiveStat {
            points += stat.points
        }
        return points
    }
    private var startingFiveStat: [PlayerStat]
    private var presenter: GamePresenterDelegate
    private let storage = Storage()
    private let players: [Player]
    
    var indexOfActivePlayer: Int {
        guard let player = activePlayer else {
            return 0
        }
        return startingFiveStat.firstIndex(of: player) ?? 0
    }
    
    init(startingFive: [Player], presenter: GamePresenterDelegate) {
        self.presenter = presenter
        self.startingFiveStat = [PlayerStat]()
        for player in startingFive {
            let stat = PlayerStat(playerId: player.id)
            startingFiveStat.append(stat)
        }
        self.players = startingFive
    }
    
    func makeSubstitution(with playerFromBundle: PlayerStat) {
        guard let player = presenter.playerFromStartForSubstitution else { return }
        if let index = startingFiveStat.firstIndex(of: player) {
            startingFiveStat.remove(at: index)
            startingFiveStat.insert(playerFromBundle, at: index)
            presenter.updateStartList()
        }
    }
    
    func savePlayersStats(for matchId: Int) {
        startingFiveStat.forEach { [weak self] (stat) in
            stat.matchId = matchId
            self?.storage.save(stat)
        }
    }
    
}

// MARK: - Helpers

private extension StartingFiveAdapter {
    
    func resetStats() {
        startingFiveStat = [PlayerStat]()
        for player in players {
            let stat = PlayerStat(playerId: player.id)
            startingFiveStat.append(stat)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension StartingFiveAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activePlayer = startingFiveStat[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .default, title: "Заменить") { [weak self] (act, indexPath) in
            guard let player = self?.startingFiveStat[indexPath.row] else { return }
            self?.presenter.makeSubstitution(of: player)
        }
        action.backgroundColor = .blue
        return [action]
    }
    
}

// MARK: - UITableViewDataSource

extension StartingFiveAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return startingFiveStat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let unwrappedCell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.nameOfClass, for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        guard let player = storage.getPlayer(by: startingFiveStat[indexPath.row].playerId) else {
            return UITableViewCell()
        }
        unwrappedCell.setup(with: player)
        return unwrappedCell
    }
    
}
