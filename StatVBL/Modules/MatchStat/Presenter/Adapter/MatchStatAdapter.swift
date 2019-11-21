//
//  MatchStatAdapter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class MatchStatAdapter: NSObject {

    var presenter: MatchStatPresenterDelegate?
    private let storage = Storage()
    private let players: [Player]
    private let stats: [PlayerStat]
    
    override init() {
        
        super.init()
    }
    
}

// MARK: - Helpers

private extension MatchStatAdapter {
        
    func presentStats(with player: Player) {
        presenter?.router.showMoreStat(for: player)
    }
    
}

// MARK: - UITableViewDelegate

extension MatchStatAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentStats(with: players[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - UITableViewDataSource

extension MatchStatAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.nameOfClass, for: indexPath) as? PlayerStatTableViewCell else {
            return UITableViewCell()
        }
//        cell.setup(with: games[indexPath.row])
        return cell
    }
    
}
