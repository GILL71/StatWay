//
//  CreateTeamPresenter.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol CreateTeamPresenterDelegate {
    var router: CreateTeamRouterDelegate { get }
    var creatingPlayerName: String { get }
    var creatingPlayerSurname: String { get }
    var creatingPlayerNumber: String { get }
    var numberOfSections: Int { get }
    func numberOfRowsIn(_ section: Int) -> Int
    func cellId(forIndexPath: IndexPath) -> String
    func config(cell: UITableViewCell, indexPath: IndexPath)
    func createPlayer()
    func nameChanged(_ text: String)
    func surnameChanged(_ text: String)
    func numberChanged(_ text: String)
    func createTeam()
}

final class CreateTeamPresenter: CreateTeamPresenterDelegate {
    private weak var view: CreateTeamViewDelegate!
    let router: CreateTeamRouterDelegate
    
    private var players = [Player]()
    
    private let createPlayerCellId = "createPlayerCell"
    private let infoCellId = "infoCell"
    
    private var tempPlayer = Player()
    
    required init(view: CreateTeamViewDelegate, router: CreateTeamRouterDelegate) {
        self.view = view
        self.router = router
    }
    
    var numberOfSections: Int {
        get {
            return 1
        }
    }
    
    var creatingPlayerName: String {
        get {
            return tempPlayer.name
        }
    }
    
    var creatingPlayerSurname: String {
        get {
            return tempPlayer.surname
        }
    }
    
    var creatingPlayerNumber: String {
        get {
            return tempPlayer.number
        }
    }
    
    func numberOfRowsIn(_ section: Int) -> Int {
        return 1 + self.players.count
    }
    
    func cellId(forIndexPath: IndexPath) -> String {
        if forIndexPath.row == 0 {
            return self.createPlayerCellId
        } else {
            return self.infoCellId
        }
    }
    
    func config(cell: UITableViewCell, indexPath: IndexPath) {
//        if let playerCell = cell as? InfoTableViewCell {
//            playerCell.numberLabel.text = players[indexPath.row - 1].number
//        }
    }
    
    func createPlayer() {
        guard let player = self.createWithValidation() else {
            return
        }
        self.players.append(player)
        self.view.updateView()
    }
    
    private func createWithValidation() -> Player? {
        do {
            let player = try Player(name: tempPlayer.name, surname: tempPlayer.surname, number: tempPlayer.number)
            tempPlayer = Player()
            self.view.clearEntryFields()
            return player
        } catch PlayerError.NoName {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.NoName.rawValue)
        } catch PlayerError.NoSurname {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.NoSurname.rawValue)
        } catch PlayerError.NoNumber {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.NoNumber.rawValue)
        } catch PlayerError.ExistingName {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.ExistingName.rawValue)
        } catch PlayerError.ExistingNumber {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.ExistingNumber.rawValue)
        } catch PlayerError.InvalidName {
            self.view.showAlert(title: "Ошибка", withText: PlayerError.InvalidName.rawValue)
        } catch _ {
            self.view.showAlert(title: "Ошибка", withText: "Не определена (возможно создатель пропустил какую-то обработку)")
        }
        return nil
    }
    
    func nameChanged(_ text: String) {
        tempPlayer.name = text
    }
    
    func surnameChanged(_ text: String) {
        tempPlayer.surname = text
    }
    
    func numberChanged(_ text: String) {
        tempPlayer.number = text
    }
    
    func createTeam() {
        
    }
}
