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
        case footer(summerizedValues: [Int])
    }
    
    // MARK: - Public Properties

    var presenter: MatchStatPresenterDelegate?
    var beDirectionalLayout: BeDirectionalLayout?
    
    // MARK: - Private Properties

    private let storage: Storage
    private var sections: [Section]
    
    // MARK: - Initiazlizers
    
    init(matchId: Int) {
        storage = Storage()
        let stats = storage.getStats(for: matchId)
        let players = storage.getPlayers()
        sections = [Section.header(values: statisticsValues)]
        var footerValues = Array(repeating: 0, count: statisticsValues.count)
        
        for stat in stats.enumerated() {
            let player = players.first { (somePlayer) -> Bool in
                return somePlayer.id == stat.element.playerId
            }
            guard let unwrappedPlayer = player else { continue }
            let item = Section.item(player: unwrappedPlayer, stat: stat.element)
            sections.append(item)
            
            for value in statisticsValues.enumerated() {
                switch value.element {
                case .points:
                    footerValues[value.offset] += stat.element.points
                case .rebounds:
                    footerValues[value.offset] += stat.element.rebounds
                case .assists:
                    footerValues[value.offset] += stat.element.assists
                case .turnovers:
                    footerValues[value.offset] += stat.element.turnovers
                case .blocks:
                    footerValues[value.offset] += stat.element.blocks
                case .steals:
                    footerValues[value.offset] += stat.element.steals
                case .fouls:
                    footerValues[value.offset] += stat.element.fouls
                case .player:
                    continue
                case .offensiveRebounds:
                    footerValues[value.offset] += stat.element.offenseRebounds
                case .defensiveRebounds:
                    footerValues[value.offset] += stat.element.defenseRebounds
                case .twoPoints:
                    footerValues[value.offset] += stat.element.twoPointsMade
                case .twoPointsAttempts:
                    footerValues[value.offset] += stat.element.twoPointsAttempts
                case .threePoints:
                    footerValues[value.offset] += stat.element.threePointsMade
                case .threePointsAttempts:
                    footerValues[value.offset] += stat.element.threePointsAttempts
                }
            }
        }
        sections.append(Section.footer(summerizedValues: footerValues))
    }
    
}

// MARK: - Helpers

private extension StatsAdapter {
    
    func setupStat(_ cell: StatInfoCollectionViewCell, stat: PlayerStat, index: Int) {
        let statValue = statisticsValues[index]
        switch statValue {
        case .player:
            break
        case .points:
            cell.setup(with: "\(stat.points)")
        case .rebounds:
            cell.setup(with: "\(stat.rebounds)")
        case .assists:
            cell.setup(with: "\(stat.assists)")
        case .turnovers:
            cell.setup(with: "\(stat.turnovers)")
        case .blocks:
            cell.setup(with: "\(stat.blocks)")
        case .steals:
            cell.setup(with: "\(stat.steals)")
        case .fouls:
            cell.setup(with: "\(stat.fouls)")
        case .defensiveRebounds:
            cell.setup(with: "\(stat.defenseRebounds)")
        case .offensiveRebounds:
            cell.setup(with: "\(stat.offenseRebounds)")
        case .twoPoints:
            cell.setup(with: "\(stat.twoPointsMade)")
        case .twoPointsAttempts:
            cell.setup(with: "\(stat.twoPointsAttempts)")
        case .threePoints:
            cell.setup(with: "\(stat.threePointsMade)")
        case .threePointsAttempts:
            cell.setup(with: "\(stat.threePointsAttempts)")
        }
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatInfoCollectionViewCell.nameOfClass, for: indexPath) as? StatInfoCollectionViewCell else {return UICollectionViewCell()}
        let section = sections[indexPath.section]
        cell.backgroundColor = indexPath.section % 2 != 0 ? .white : .groupTableViewBackground
        switch section {
        case let .header(values):
            cell.setup(with: values[indexPath.row])
            cell.backgroundColor = .groupTableViewBackground
            return cell
        case let .footer(values):
            if indexPath.row == 0 {
                cell.setup(with: "Всего")
            } else {
                cell.setup(with: "\(values[indexPath.row])")
            }
        case let .item(player, stat):
            if indexPath.row == 0 {
                cell.setup(with: player.fullName)
            } else {
                setupStat(cell, stat: stat, index: indexPath.row)
            }
        }
        return cell
    }
    
}

// MARK: - BeDirectionalViewLayoutDelegate

extension StatsAdapter: BeDirectionalViewLayoutDelegate {
    
    func numberOfColumns() -> Int {
        return statisticsValues.count
    }
    
}
