//
//  MatchStatViewController.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol MatchStatViewDelegate: class {
    var layout: BeDirectionalLayout? { get set }
}

final class MatchStatViewController: UIViewController {
    
    // MARK - IBOutlets
    
    @IBOutlet private weak var statsCollectionView: UICollectionView!

    // MARK - Public properties

    var presenter: MatchStatPresenterDelegate!
    var configurator: MatchStatConfiguratorDelegate!
    var layout: BeDirectionalLayout?
    
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
        statsCollectionView.register(UINib(nibName: StatInfoCollectionViewCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: StatInfoCollectionViewCell.nameOfClass)
        statsCollectionView.delegate = presenter.statsAdapter
        statsCollectionView.dataSource = presenter.statsAdapter
        statsCollectionView.bounces = false
        let gridLayout = BeDirectionalLayout(delegate: presenter.statsAdapter)
        layout = gridLayout
        statsCollectionView.collectionViewLayout = gridLayout
        statsCollectionView.isDirectionalLockEnabled = true
        statsCollectionView.showsVerticalScrollIndicator = false
        statsCollectionView.showsHorizontalScrollIndicator = false
//        statsCollectionView.isPagingEnabled = true
        presenter.setupAdapter()
    }
    
}
