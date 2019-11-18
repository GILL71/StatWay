//
//  GameSetUpPresenter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 05/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol GameSetUpPresenterDelegate {
    var router: GameSetUpRouterDelegate { get }
    var switcherIsOn: Bool { get }
    func firstTeamDidBeginEditing()
    func secondTeamDidBeginEditing()
    func switchTapped()
    func choosen(home team: String)
    func choosen(away team: String)
    func firstTeamDidEndEditing(withText: String?)
    func secondTeamDidEndEditing(withText: String?)
    func playAction()
}

//enum NumberOfTeams {
//    case One(teamHome: Team?, teamAway: String?)
//    case Two(teamHome: Team?, teamAway: Team?)
//}

class GameSetUpPresenter {//: GameSetUpPresenterDelegate {
    
    private weak var view: GameSetUpViewDelegate!
    let router: GameSetUpRouterDelegate
    
//    private var teamsSettings = NumberOfTeams.One(teamHome: nil, teamAway: nil)
    
    private let storage = Storage()
    
//    private var teams = [Team]()
    
    required init(view: GameSetUpViewDelegate, router: GameSetUpRouterDelegate) {
        self.view = view
        self.router = router
    }
    
//    var switcherIsOn: Bool {
//        get {
//            switch self.teamsSettings {
//            case .One(teamHome: _, teamAway: _):
//                return false
//            case .Two(teamHome: _, teamAway: _):
//                return true
//            }
//        }
//    }
    
//    var isSettingsUp: Bool {
//        get {
//            switch self.teamsSettings {
//            case let .One(teamHome: home, teamAway: away):
//                if home != nil, away != nil, !(away?.isEmpty ?? true) {
//                    return true
//                }
//            case let .Two(teamHome: home, teamAway: away):
//                if home != nil, away != nil {
//                    return true
//                }
//            }
//            return false
//        }
//    }
    
    func firstTeamDidBeginEditing() {
//        if self.teams.isEmpty {
//            self.view.showAlert(title: "У вас нет команд", withText: "Сначала заведите ее во вкладке \"Создать\"")
//        } else {
////            let teamNames = self.teams.map { return $0.name }
////            self.view.showChooseHomeTeam(from: teamNames)
//        }
    }
    
    func secondTeamDidBeginEditing() {
//        if self.teams.isEmpty {
//            self.view.showAlert(title: "У вас нет команд", withText: "Сначала заведите ее во вкладке \"Создать\"")
//        } else {
////            let teamNames = self.teams.map { return $0.name }
////            self.view.showChooseAwayTeam(from: teamNames)
//        }
    }
    
    func switchTapped() {
//        switch self.teamsSettings {
//        case let .One(teamHome: home, teamAway: _):
//            self.teamsSettings = .Two(teamHome: home, teamAway: nil)
//        case let .Two(teamHome: home, teamAway: away):
//            self.teamsSettings = .One(teamHome: home, teamAway: away?.name)
//        }
    }
    
    func choosen(home team: String) {
//        if let homeTeam = self.teams.filter({ $0.name == team }).first {
//            switch self.teamsSettings {
//            case let .One(teamHome: _, teamAway: away):
//                self.teamsSettings = .One(teamHome: homeTeam, teamAway: away)
//            case let .Two(teamHome: _, teamAway: away):
//                self.teamsSettings = .Two(teamHome: homeTeam, teamAway: away)
//            }
//        } else {
//            self.view.showAlert(title: "Неизвестная ошибка", withText: "Нет такой команды")
//        }
    }
    
    func choosen(away team: String) {
//        switch self.teamsSettings {
//        case let .One(teamHome: home, teamAway: _):
//            self.teamsSettings = .One(teamHome: home, teamAway: team)
//        case let .Two(teamHome: home, teamAway: _):
//            let awayTeam = self.teams.filter({ $0.name == team }).first
//            self.teamsSettings = .Two(teamHome: home, teamAway: awayTeam)
//        }
    }
    
    func firstTeamDidEndEditing(withText: String?) {
        //
    }
    
    func secondTeamDidEndEditing(withText: String?) {
//        switch self.teamsSettings {
//        case let .One(teamHome: home, teamAway: _):
//            self.teamsSettings = .One(teamHome: home, teamAway: withText)
//        case let .Two(teamHome: home, teamAway: away):
//            self.teamsSettings = .Two(teamHome: home, teamAway: away)
//        }
    }
    
    func playAction() {
//        if self.isSettingsUp {
//            self.router.performGame(with: self.teamsSettings)
//        } else {
//            self.view.showAlert(title: "Сначала настройте матч", withText: "")
//        }
    }
}
