//
//  SaveGamePresenter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 09.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol SaveGamePresenterDelegate: class {
    var router: SaveGameRouterDelegate { get }
    
    func pointsChanged(_ text: String)
    func nameChanged(_ text: String)
    func commentChanged(_ text: String)
    
    func saveGameAction()
    func setupView()
}

final class SaveGamePresenter {

    private weak var view: SaveGameViewDelegate!
    let router: SaveGameRouterDelegate
    
    private var homeTeamPoints = 0
    private var awayTeamPoints = 0
    private var homeTeamName = ""
    private var awayTeamName = ""
    private var comment: String? = nil
    private var date: String {
        get {
            let currentDateTime = Date()

            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .long

            return formatter.string(from: currentDateTime)
        }
    }
    
    private let storage = Storage()
    private weak var saveDelegate: SaveGameDelegate?
    
    required init(view: SaveGameViewDelegate, router: SaveGameRouterDelegate, homeTeamPoints: Int, homeTeamName: String, saveDelegate: SaveGameDelegate?) {
        self.view = view
        self.router = router
        self.homeTeamPoints = homeTeamPoints
        self.homeTeamName = homeTeamName
        self.saveDelegate = saveDelegate
    }
    
}

extension SaveGamePresenter: SaveGamePresenterDelegate {
    
    func pointsChanged(_ text: String) {
        awayTeamPoints = Int(text) ?? 0
    }
    
    func nameChanged(_ text: String) {
        awayTeamName = text
    }
    
    func commentChanged(_ text: String) {
        comment = text
    }
    
    func saveGameAction() {
        let matchId = storage.generateMatchId()
        do {
            let match = try Match(id: matchId, hPoints: homeTeamPoints, aPoints: awayTeamPoints, hName: homeTeamName, aName: awayTeamName, date: date, comment: comment)
            storage.save(match)
            saveDelegate?.savePlayersStats(for: matchId)
            view?.hideScreen()
        } catch {
            guard let matchError = error as? MatchError else {
                return
            }
            view.showAlert(title: matchError.rawValue, withText: "")
        }
    }
    
    func setupView() {
        view.updateHomeNameLabel(with: homeTeamName)
        view.updateHomePointsLabel(with: "\(homeTeamPoints)")
        view.setupAwayPointsTextField()
        view.setupAwayNameTextField()
        view.setupCommentTextField()
        view.setupButton()
    }
    
}
