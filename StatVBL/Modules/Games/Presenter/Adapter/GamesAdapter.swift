//
//  GamesAdapter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class GamesAdapter: NSObject {

    var presenter: GamesPresenterDelegate?
    private let storage = Storage()
    private let games: [Match]
    
    override init() {
        games = storage.getMatches()
        super.init()
    }
    
}

// MARK: - Helpers

private extension GamesAdapter {
        
    func presentStats(with match: Match) {
        presenter.router.showStat(for: match)
    }
    
}

// MARK: - UITableViewDelegate

extension GamesAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentStats(with: games[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

// MARK: - UITableViewDataSource

extension GamesAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.nameOfClass, for: indexPath) as? GameTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: games[indexPath.row])
        return cell
    }
    
}
