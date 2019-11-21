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
    
    // MARK - Public properties

    var presenter: MatchStatPresenterDelegate!
    var configurator: MatchStatConfiguratorDelegate!
    
    // MARK - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        setupNavBar()
        setupTableView()
        presenter.setupAdapter()
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
        playersTableView.delegate = presenter.adapter
        playersTableView.dataSource = presenter.adapter
        
        let footerView = UIView()
        footerView.backgroundColor = .white
        playersTableView.tableFooterView = footerView
    }
    
}
