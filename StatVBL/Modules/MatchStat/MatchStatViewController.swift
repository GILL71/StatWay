//
//  MatchStatViewController.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol MatchStatViewDelegate: class {
    
}

final class MatchStatViewController: UIViewController {
    
    // MARK - IBOutlets
    
    @IBOutlet private weak var playersTableView: UITableView!
    @IBOutlet private weak var statsCollectionView: UICollectionView!

    // MARK - Public properties

    var presenter: MatchStatPresenterDelegate!
    var configurator: MatchStatConfiguratorDelegate!
    
    // MARK - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        setupNavBar()
        setupTableView()
    }

}

// MARK - MatchStatViewDelegate

extension MatchStatViewController: MatchStatViewDelegate {
    
    
    
}

// MARK - Setup

extension MatchStatViewController {
    
    func setupNavBar() {
        navigationItem.title = "БУРАН"
    }
    
    func setupTableView() {
        playersTableView.isScrollEnabled = false
        playersTableView.registerNib(PlayerStatTableViewCell.self)
        playersTableView.delegate = presenter.playersAdapter
        playersTableView.dataSource = presenter.playersAdapter
        playersTableView.separatorStyle = .none
        
        statsCollectionView.register(UINib(nibName: StatInfoCollectionViewCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: StatInfoCollectionViewCell.nameOfClass)
        statsCollectionView.delegate = presenter.statsAdapter
        statsCollectionView.dataSource = presenter.statsAdapter
        
        statsCollectionView.register(StatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StatsHeaderView.nameOfClass)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.headerReferenceSize = CGSize(width: statsCollectionView.frame.width, height: 32)
        statsCollectionView.collectionViewLayout = flowLayout
        
        presenter.setupAdapter()
        
        let footerView = UIView()
        footerView.backgroundColor = .white
        playersTableView.tableFooterView = footerView
    }
    
}
