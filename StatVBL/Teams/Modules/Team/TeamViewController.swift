//
//  TeamViewController.swift
//  StatVBL
//
//  Created by Michael Nechaev on 15/02/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol TeamViewDelegate: class {
    func showAlert(title: String, withText: String)
    func updateView()
}

final class TeamViewController: UIViewController, TeamViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: TeamPresenterDelegate!
    var configurator: TeamConfiguratorDelegate!

    @IBOutlet weak var teamTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        setupNavBar()
        setupTableView()
    }
    
    @objc
    func showCreatePlayer() {
        presenter.router.showCreatePlayer()
    }
    
    func showAlert(title: String, withText: String) {
        self.showAlert(title, withText)
    }
    
    func updateView() {
        teamTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsIn(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = self.presenter.cellId(forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : .groupTableViewBackground
        self.presenter.config(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 44))
        let numLabel = UILabel(frame: CGRect(x: 32, y: 10, width: 10, height: 34))
        numLabel.font = UIFont.systemFont(ofSize: 13)
        numLabel.textColor = UIColor.darkGray
        numLabel.text = "#"
        let nameLabel = UILabel(frame: CGRect(x: 82, y: 10, width: tableView.frame.size.width - 36, height: 34))
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textColor = UIColor.darkGray
        nameLabel.text = "Имя"
//        let statLabel = UILabel(frame: CGRect(x: tableView.frame.size.width - 16, y: 10, width: 20, height: 44))
//        statLabel.font = UIFont.systemFont(ofSize: 13)
//        statLabel.textColor = UIColor.darkGray
//        statLabel.text = "ИНФО"
        view.addSubview(nameLabel)
        view.addSubview(numLabel)
//        view.addSubview(statLabel)
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
    }
    
}

extension TeamViewController: CreatePlayerDelegate {
    
    func updateViewForNewPlayer() {
        presenter.updateSource()
    }
    
}

// MARK: - Setup

private extension TeamViewController {
    
    func setupNavBar() {
        navigationItem.title = "БУРАН"
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showCreatePlayer))
        navigationItem.rightBarButtonItems = [barButton]
        navigationController?.navigationBar.tintColor = .blue
    }
    
    func setupTableView() {
        teamTableView.registerNib(PlayerTableViewCell.self)
        teamTableView.delegate = self
        teamTableView.dataSource = self
    }
    
}
