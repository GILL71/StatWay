//
//  CreatePlayerPresenter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation
import UIKit

protocol CreatePlayerPresenterDelegate {
    var router: CreatePlayerRouterDelegate { get }
    var creatingPlayerName: String { get }
    var creatingPlayerSurname: String { get }
    var creatingPlayerNumber: String { get }
    func createPlayer()
    func nameChanged(_ text: String)
    func surnameChanged(_ text: String)
    func numberChanged(_ text: String)
}

final class CreatePlayerPresenter {
    private weak var view: CreatePlayerViewDelegate!
    let router: CreatePlayerRouterDelegate
    
    private var players = [Player]()
    
    private let createPlayerCellId = "createPlayerCell"
    private let infoCellId = "infoCell"
    
    private var tempPlayer = Player()
    private let storage = Storage()
    
    required init(view: CreatePlayerViewDelegate, router: CreatePlayerRouterDelegate) {
        self.view = view
        self.router = router
    }
    
}

extension CreatePlayerPresenter: CreatePlayerPresenterDelegate {

    var creatingPlayerName: String {
        return tempPlayer.name
    }
    
    var creatingPlayerSurname: String {
        return tempPlayer.surname
    }
    
    var creatingPlayerNumber: String {
        return tempPlayer.number
    }
    
    func createPlayer() {
        do {
            let newPlayer = try Player(name: tempPlayer.name, surname: tempPlayer.surname, number: tempPlayer.number)
            storage.add(newPlayer)
            view.hideScreen()
        } catch(let error) {
            if let nameError = error as? PlayerError {
                view.showAlert(title: nameError.localizedDescription, withText: "")
            }
        }
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
    
}
