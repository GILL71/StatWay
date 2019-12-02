//
//  StatsAdapter.swift
//  StatVBL
//
//  Created by Angels It on 21.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

let statisticsValues: [ViewStatValue] = [.player, .points, .rebounds, .assists, .turnovers, .blocks, .steals, .fouls]

final class StatsAdapter: NSObject {
    
    // MARK: - Enums
    
    private enum Section {
        case header(values: [ViewStatValue])
        case item(player: Player, stat: PlayerStat)
        case footer(summerizedValues: [String])
    }
    
    // MARK: - Public Properties

    var presenter: MatchStatPresenterDelegate?
    var beDirectionalLayout: BeDirectionalLayout?
    
    // MARK: - Private Properties

    private let storage: Storage
//    private let stats: [PlayerStat]
//    private let players: [Player]
    private let sections: [Section]
    
    init(matchId: Int) {
        storage = Storage()
        let stats = storage.getStats(for: matchId)
        let players = storage.getPlayers()
        sections = [Section.header(values: statisticsValues)]
//        for player in players {
//            let stat = stats.first { (someStat) -> Bool in
//                return someStat.playerId == player.id
//            }
//            guard let unwrappedStat = stat else { continue }
//            let item = Section.item(player: player, stat: unwrappedStat)
//            sections.append(item)
//        }
        var footerValues = [String]()
        
//        for stat in stats {
//            let player = players.first { (somePlayer) -> Bool in
//                return somePlayer.id == stat.playerId
//            }
//            guard let unwrappedPlayer = player else { continue }
//            let item = Section.item(player: unwrappedPlayer, stat: stat)
//            sections.append(item)
//            switch headerValue {
//            case .player:
//            case .
//            default:
//                <#code#>
//            }
//        }
//        for headerValue in statisticsValues {
//            switch headerValue {
//            case .player:
//            case .
//            default:
//                <#code#>
//            }
//        }
        sections.append(Section.footer)
    }
    
}

// MARK: - Helpers

private extension StatsAdapter {
        
    func setupPlayer(_ cell: StatInfoCollectionViewCell, player: Player) {
        cell.setup(with: player.fullName)
        cell.backgroundColor = .yellow
    }
    
    func setupStat(_ cell: StatInfoCollectionViewCell, stat: PlayerStat, index: Int) {
        let statValue = statisticsValues[index]
        let value = stat.getValue(for: statValue)
        cell.setup(with: value)
    }

    
}

// MARK: - UICollectionViewDelegate

extension StatsAdapter: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension StatsAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statisticsValues.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatInfoCollectionViewCell.nameOfClass, for: indexPath) as? StatInfoCollectionViewCell else {return UICollectionViewCell()}
//        if indexPath.section == 0 {
//            cell.setup(with: statisticsValues[indexPath.row])
//            cell.backgroundColor = .groupTableViewBackground
//            return cell
//        }
//        if indexPath.section == players.count + 1 && indexPath.row == 0 {
//            cell.setup(with: "Всего")
//            cell.backgroundColor = .white
//            return cell
//        } else if indexPath.section == players.count + 1 {
//            switch indexPath.row {
//            case 1:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.points
//                }
//                cell.setup(with: "\(allPoints)")
//            case 2:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.rebounds
//                }
//                cell.setup(with: "\(allPoints)")
//            case 3:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.threePointsMade
//                }
//                cell.setup(with: "\(allPoints)")
//            case 4:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.freeThrowsMade
//                }
//                cell.setup(with: "\(allPoints)")
//            case 5:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.rebounds
//                }
//                cell.setup(with: "\(allPoints)")
//            case 6:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.assists
//                }
//                cell.setup(with: "\(allPoints)")
//            case 7:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.steals
//                }
//                cell.setup(with: "\(allPoints)")
//            case 8:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.blocks
//                }
//                cell.setup(with: "\(allPoints)")
//            case 9:
//                var allPoints = 0
//                for stat in stats {
//                    allPoints += stat.turnovers
//                }
//                cell.setup(with: "\(allPoints)")
//            default:
//                break
//            }
//            return cell
//        }
//
//        if indexPath.row == 0 {
//            if indexPath.section > 0 {
//                cell.setup(with: players[indexPath.section - 1].fullName)
//            }
//            cell.backgroundColor = .yellow
//            return cell
//        }
//        let playerId = players[indexPath.section - 1].id
//        let stat = stats.first { stat -> Bool in
//            return stat.playerId == playerId
//        }
//        switch indexPath.row {
//        case 1:
//            cell.setup(with: "\(stat?.points ?? 0)")
//        case 2:
//            cell.setup(with: "\(stat?.points ?? 0)")
//        case 3:
//            cell.setup(with: "\(stat?.threePointsMade ?? 0)")
//        case 4:
//            cell.setup(with: "\(stat?.freeThrowsMade ?? 0)")
//        case 5:
//            cell.setup(with: "\(stat?.rebounds ?? 0)")
//        case 6:
//            cell.setup(with: "\(stat?.assists ?? 0)")
//        case 7:
//            cell.setup(with: "\(stat?.steals ?? 0)")
//        case 8:
//            cell.setup(with: "\(stat?.blocks ?? 0)")
//        case 9:
//            cell.setup(with: "\(stat?.turnovers ?? 0)")
//        default:
//            break
//        }
//        cell.backgroundColor = .white
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatInfoCollectionViewCell.nameOfClass, for: indexPath) as? StatInfoCollectionViewCell else {return UICollectionViewCell()}
        let section = sections[indexPath.section]
        switch section {
        case let .header(values):
            cell.setup(with: values[indexPath.row])
            cell.backgroundColor = .groupTableViewBackground
            return cell
        case .footer:
            break
//            let summerizedValue
//            cell.setup(with: summerizedValue)
        case let .item(player, stat):
            if indexPath.row == 0 {
                setupPlayer(cell, player: player)
            } else {
                setupStat(cell, stat: stat, index: indexPath.row)
            }
        }
    }
    
}

// MARK: -

extension StatsAdapter: BeDirectionalViewLayoutDelegate {
    
    func numberOfColumns() -> Int {
        return statisticsValues.count
    }
    
}
