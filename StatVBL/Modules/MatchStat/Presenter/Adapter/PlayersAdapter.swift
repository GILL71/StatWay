//
//  MatchStatAdapter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class PlayersAdapter: NSObject {

    var presenter: MatchStatPresenterDelegate?
    private let storage: Storage
    private let players: [Player]
    
    override init() {
        storage = Storage()
        players = storage.getPlayers()
        super.init()
    }
    
}

// MARK: - Helpers

private extension PlayersAdapter {
        
    func presentStats(with player: Player) {
        presenter?.router.showMoreStat(for: player)
    }
    
}

// MARK: - UITableViewDelegate

extension PlayersAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentStats(with: players[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 32))
        headerView.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 6, y: 8, width: tableView.frame.width - 16, height: 32))
        headerView.addSubview(label)
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = "Игрок"
        return headerView
    }
    
}

// MARK: - UITableViewDataSource

extension PlayersAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerStatTableViewCell.nameOfClass, for: indexPath) as? PlayerStatTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: players[indexPath.row])
        return cell
    }
    
}
