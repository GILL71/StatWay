//
//  SaveGameViewController.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 09.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol SaveGameViewDelegate: class {
    func showAlert(title: String, withText: String)
    func updateView()
    func clearEntryFields()
    func hideScreen()
    
    func updateHomePointsLabel(with text: String)
    func updateHomeNameLabel(with text: String)
    func setupAwayPointsTextField()
    func setupAwayNameTextField()
    func setupCommentTextField()
    func setupButton()
}

final class SaveGameViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var middleLabel: UILabel!
    @IBOutlet private weak var awayTeamPointsTextfield: UITextField!
    @IBOutlet private weak var awayTeamNameTextfield: UITextField!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var commentTextfield: UITextField!
    @IBOutlet private weak var teamNameLabel: UILabel!
    @IBOutlet private weak var saveButton: UIButton!
    
    // MARK: - Public properties
    
    var presenter: SaveGamePresenterDelegate!
    var configurator: SaveGameConfiguratorDelegate!
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.config(viewController: self)
        presenter.setupView()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        presenter.saveGameAction()
    }
    
}

extension SaveGameViewController: SaveGameViewDelegate {
    
    func showAlert(title: String, withText: String) {
        
    }
    
    func updateView() {
        
    }
    
    func clearEntryFields() {
        
    }
    
    func hideScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateHomePointsLabel(with text: String) {
        pointsLabel.text = text
    }
    
    func updateHomeNameLabel(with text: String) {
        teamNameLabel.text = text
    }
    
    func setupAwayPointsTextField() {
        awayTeamPointsTextfield.placeholder = "Очки"
        awayTeamPointsTextfield.keyboardType = .numberPad
        awayTeamPointsTextfield.delegate = self
    }
    
    func setupAwayNameTextField() {
        awayTeamNameTextfield.placeholder = "Команда"
        awayTeamNameTextfield.keyboardType = .asciiCapable
        awayTeamNameTextfield.delegate = self
    }
    
    func setupCommentTextField() {
        commentTextfield.placeholder = "Комментарий"
        commentTextfield.keyboardType = .asciiCapable
        commentTextfield.delegate = self
    }
    
    func setupButton() {
        saveButton.setTitle("Сохранить", for: .normal)
    }
    
}

extension SaveGameViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case awayTeamPointsTextfield:
            presenter.nameChanged(text)
        case awayTeamNameTextfield:
            presenter.pointsChanged(text)
        case commentTextfield:
            presenter.commentChanged(text)
        default:
            break
        }
        return true
    }
    
}
