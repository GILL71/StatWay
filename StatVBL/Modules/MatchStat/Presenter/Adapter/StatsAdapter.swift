//
//  StatsAdapter.swift
//  StatVBL
//
//  Created by Angels It on 21.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

let statisticsValues = ["Player", "PTS", "2PTS", "3PTS", "FT", "REB", "AST", "STL", "BLK", "TO"]

final class StatsAdapter: NSObject {

    var presenter: MatchStatPresenterDelegate?
    var beDirectionalLayout: BeDirectionalLayout?
    private let storage: Storage
    private let stats: [PlayerStat]
    private let players: [Player]
    
    init(matchId: Int) {
        storage = Storage()
        stats = storage.getStats(for: matchId)
        players = storage.getPlayers()
    }
    
}

// MARK: - Helpers

private extension StatsAdapter {
        
    
}

// MARK: - UICollectionViewDelegate

extension StatsAdapter: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension StatsAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return players.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statisticsValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatInfoCollectionViewCell.nameOfClass, for: indexPath) as? StatInfoCollectionViewCell else {return UICollectionViewCell()}
        if indexPath.section == 0 {
            cell.setup(with: statisticsValues[indexPath.row])
            cell.backgroundColor = .groupTableViewBackground
            return cell
        }
        if indexPath.row == 0 {
            if indexPath.section > 0 {
                cell.setup(with: players[indexPath.section - 1].fullName)
            }
            cell.backgroundColor = .yellow
            return cell
        }
        let playerId = players[indexPath.section - 1].id
        let stat = stats.first { stat -> Bool in
            return stat.playerId == playerId
        }
        switch indexPath.row {
        case 1:
            cell.setup(with: "\(stat?.points ?? 0)")
        case 2:
            cell.setup(with: "\(stat?.points ?? 0)")
        case 3:
            cell.setup(with: "\(stat?.threePointsMade ?? 0)")
        case 4:
            cell.setup(with: "\(stat?.freeThrowsMade ?? 0)")
        case 5:
            cell.setup(with: "\(stat?.rebounds ?? 0)")
        case 6:
            cell.setup(with: "\(stat?.assists ?? 0)")
        case 7:
            cell.setup(with: "\(stat?.steals ?? 0)")
        case 8:
            cell.setup(with: "\(stat?.blocks ?? 0)")
        case 9:
            cell.setup(with: "\(stat?.turnovers ?? 0)")
        default:
            break
        }
        cell.backgroundColor = .white
        return cell
    }
    
}

// MARK: -

extension StatsAdapter: BeDirectionalViewLayoutDelegate {
    
    func numberOfColumns() -> Int {
        return statisticsValues.count
    }
    
}
