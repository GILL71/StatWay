//
//  GameViewController.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 28.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol GameViewDelegate: class {
    func showTapTip()
    func showBundle()
    func hideBundle()
    func showSubstitutionAlert(for startName: String, on bundleName: String)
    func reloadStart()
    func reloadBundle()
    func deselectStartPlayer(at indexPath: IndexPath)
}

protocol SaveGameDelegate: class {
    func savePlayersStats(for matchId: Int)
}

final class GameViewController: UIViewController {
        
    @IBOutlet private weak var homeTeamTableView: UITableView!
    @IBOutlet private weak var bundleButton: UIButton!
    @IBOutlet private weak var bundleButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bundleTalbeView: UITableView!
    @IBOutlet private weak var pointsAction: RadialMenu!
    @IBOutlet private weak var defenseAction: RadialMenu!
    @IBOutlet private weak var offenseAction: RadialMenu!
    
    var presenter: GamePresenterDelegate!
    var configurator: GameConfiguratorDelegate!
    
    private var selectedStartIndex = IndexPath()
    private var selectedBundleIndex = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        setupTableView()
        setupButtons()
        setupNavBar()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
        //кейс - если пустая команда, viewDidload уже отработал и забрал 0 игроков
        //а ты потом насоздавал еще
        //то второй забор не произойдет - только после перезапуска
        //presenter.refreshTeam()
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupBundle()
    }

}

// MARK: - Actions

extension GameViewController {
    
    @IBAction func bundleButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.9) {
            if self.bundleButtonBottomConstraint.constant == 0 {
                self.bundleButtonBottomConstraint.constant = 190
            } else {
                self.bundleButtonBottomConstraint.constant = 0
            }
            self.view.layoutSubviews()
        }
    }
    
    @objc
    func saveGameAction() {
        presenter.router.showSaveGame(with: presenter.overAllPoints)
    }

}

// MARK: - GameViewDelegate

extension GameViewController: GameViewDelegate {

    func showTapTip() {
        showTip(with: "Выделите игрока в таблице, а затем повторите действие")
    }
    
    func showBundle() {
        UIView.animate(withDuration: 0.9) {
            if self.bundleButtonBottomConstraint.constant == 0 {
                self.bundleButtonBottomConstraint.constant = 190
            }
            self.view.layoutSubviews()
        }
    }
    
    func hideBundle() {
        UIView.animate(withDuration: 0.9) {
            if self.bundleButtonBottomConstraint.constant != 0 {
                self.bundleButtonBottomConstraint.constant = 0
            }
            self.view.layoutSubviews()
        }
    }
    
    func showSubstitutionAlert(for startName: String, on bundleName: String) {
        let alert = UIAlertController(title: "Поменять \(startName) на \(bundleName)?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            self?.presenter.completeSubstitution()
            self?.hideBundle()

        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { [weak self] (_) in
            self?.presenter.cancelSubstitution()
            self?.hideBundle()
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func reloadStart() {
        homeTeamTableView.reloadData()
    }
    
    func reloadBundle() {
        bundleTalbeView.reloadData()
    }
    
    func deselectStartPlayer(at indexPath: IndexPath) {
        homeTeamTableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: - Setup

private extension GameViewController {
    
    func setupTableView() {
        presenter.setupAdapters()
        
        homeTeamTableView.isScrollEnabled = false
        homeTeamTableView.registerNib(PlayerTableViewCell.self)
        homeTeamTableView.delegate = presenter.startingFiveAdapter
        homeTeamTableView.dataSource = presenter.startingFiveAdapter
        
        bundleTalbeView.isScrollEnabled = false
        bundleTalbeView.registerNib(PlayerTableViewCell.self)
        bundleTalbeView.delegate = presenter.bundleAdapter
        bundleTalbeView.dataSource = presenter.bundleAdapter
        
        let footerView = UIView()
        footerView.backgroundColor = .white
        homeTeamTableView.tableFooterView = footerView
    }
    
    func setupButtons() {
        setupStatsButtons()
    }
    
    func setupStatsButtons() {
        setupPointsButton()
        setupAttackActionsButton()
        setupDefenseActionsButton()
    }
    
    func setupBundle() {
        bundleButton.rounded(corners: [.topLeft, .topRight])
    }
    
    func setupNavBar() {
        let completeItem = UIBarButtonItem(title: "Завершить", style: .done, target: self, action: #selector(saveGameAction))
        navigationItem.rightBarButtonItem = completeItem
    }
    
}


// MARK: - Setup stats buttons

private extension GameViewController {
    
    func setupPointsButton() {
        //        menu.title = "P"
        pointsAction.image = UIImage(named: "BallIcon")
        pointsAction.layer.cornerRadius = pointsAction.frame.width / 2
        //        menu.backgroundColor = .red
        let onePoint = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .onePoint)
        }, title: "1")
        let twoPoint = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .twoPoints)
        }, title: "2")
        let threePoint = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .threePoints)
        }, title: "3")
        pointsAction.setItems(with: [onePoint, twoPoint, threePoint])
        pointsAction.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        pointsAction.setStartingPositions(.pi)
    }
    
    func setupAttackActionsButton() {
        //        menu.title = "P"
        offenseAction.image = UIImage(named: "HandIcon")
        offenseAction.layer.cornerRadius = offenseAction.frame.width / 2
        //        menu.backgroundColor = .red
        let ofRebound = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .offensiveRebound)
        }, title: "R")
        let assist = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .assist)
        }, title: "A")
        let turnover = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .turnover)
        }, title: "T")
        offenseAction.setItems(with: [ofRebound, assist, turnover])
        offenseAction.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        offenseAction.setStartingPositions(3 * .pi/2 - .pi / 4, arcLength: .pi / 2)
    }
    
    func setupDefenseActionsButton() {
        //        menu.title = "P"
        defenseAction.image = UIImage(named: "LockIcon")
        defenseAction.layer.cornerRadius = defenseAction.frame.width / 2
        //        menu.backgroundColor = .red
        let defRebound = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .defensiveRebound)
        }, title: "R")
        let steal = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .steal)
        }, title: "S")
        let block = RadialMenu.ItemSettings(action: { [weak self] in
            self?.presenter.countSelectedPlayer(stat: .block)
        }, title: "B")
        defenseAction.setItems(with: [defRebound, steal, block])
        defenseAction.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        defenseAction.setStartingPositions(-.pi, arcLength: .pi / 2)
    }
    
}

// MARK: - SaveGameDelegate

extension GameViewController: SaveGameDelegate {
    
    func savePlayersStats(for matchId: Int) {
        presenter.saveStats(for: matchId)
    }

}
