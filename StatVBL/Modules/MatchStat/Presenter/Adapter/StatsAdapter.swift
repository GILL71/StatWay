//
//  StatsAdapter.swift
//  StatVBL
//
//  Created by Angels It on 21.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class StatsAdapter: NSObject {

    var presenter: MatchStatPresenterDelegate?
    private let storage: Storage
    private let stats: [PlayerStat]
//    private var headerView: StatsHeaderView?
    
    init(matchId: Int) {
        storage = Storage()
        stats = storage.getStats(for: matchId)
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
        return stats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatInfoCollectionViewCell.nameOfClass, for: indexPath) as? StatInfoCollectionViewCell else {return UICollectionViewCell()}
        cell.setup(with: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StatsHeaderView.nameOfClass, for: indexPath) as? StatsHeaderView else {
            return UICollectionReusableView()
        }
        headerView.frame.size = CGSize(width: 300, height: 32)
//        self.headerView = headerView
        return headerView
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension StatsAdapter: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }

}
