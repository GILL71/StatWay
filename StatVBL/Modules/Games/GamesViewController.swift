//
//  GamesViewController.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol GamesViewDelegate: class {
    
}

final class GamesViewController: UIViewController {
    
    // MARK - IBOutlets
    
    @IBOutlet private weak var gamesTableView: UITableView!
    
    // MARK - Public properties

    var presenter: GamesPresenterDelegate!
    var configurator: GamesConfiguratorDelegate!
    
    // MARK - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        setupNavBar()
        setupTableView()
        presenter.setupAdapter()
    }

}

// MARK - GamesViewDelegate

extension GamesViewController: GamesViewDelegate {
    
    
    
}

// MARK - Setup

extension GamesViewController {
    
    func setupNavBar() {
        navigationItem.title = "БУРАН"
    }
    
    func setupTableView() {
        gamesTableView.isScrollEnabled = false
        gamesTableView.registerNib(GameTableViewCell.self)
        gamesTableView.delegate = presenter.adapter
        gamesTableView.dataSource = presenter.adapter
        
        let footerView = UIView()
        footerView.backgroundColor = .white
        gamesTableView.tableFooterView = footerView
    }
    
}
