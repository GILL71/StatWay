//
//  GameSetUpViewController.swift
//  StatVBL
//
//  Created by Michael Nechaev on 05/11/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

protocol GameSetUpViewDelegate: class {
    func showAlert(title: String, withText: String)
    func showChooseAwayTeam(from teamNames: [String])
    func showChooseHomeTeam(from teamNames: [String])
}

class GameSetUpViewController: UIViewController, GameSetUpViewDelegate, UITextFieldDelegate {

    var presenter: GameSetUpPresenterDelegate!
    var configurator: GameSetUpConfiguratorDelegate!
    
    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var firstTeamTextField: UITextField!
    @IBOutlet weak var secondTeamTextField: UITextField!
    
    let selfToGame = "Play"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.configurator.config(viewController: self)
//        self.switcher.isOn = self.presenter.switcherIsOn
    }
    
    func showAlert(title: String, withText: String) {
        self.showAlert(title, withText)
    }
    
  
    @IBAction func switchTapped(_ sender: UISwitch) {
        self.presenter.switchTapped()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case self.firstTeamTextField:
            self.presenter.firstTeamDidBeginEditing()
        case self.secondTeamTextField:
            self.presenter.secondTeamDidBeginEditing()
        default:
            return
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case self.firstTeamTextField:
            self.presenter.firstTeamDidEndEditing(withText: textField.text)
        case self.secondTeamTextField:
            self.presenter.secondTeamDidEndEditing(withText: textField.text)
        default:
            return
        }
    }
    
    func showChooseAwayTeam(from teamNames: [String]) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for team in teamNames {
            let action = UIAlertAction(title: team, style: .default) { [weak self] (_) in
                self?.presenter.choosen(home: team)
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showChooseHomeTeam(from teamNames: [String]) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for team in teamNames {
            let action = UIAlertAction(title: team, style: .default) { [weak self] (_) in
                self?.presenter.choosen(away: team)
            }
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func playAction(_ sender: Any) {
        self.presenter.playAction()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.router.prepare(for: segue, sender: sender)
    }
}
