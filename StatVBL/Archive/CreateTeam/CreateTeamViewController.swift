//
//  CreateTeamViewController.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import UIKit

protocol CreateTeamViewDelegate: class {
    func showAlert(title: String, withText: String)
    func updateView()
    func clearEntryFields()
}

final class CreateTeamViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var createTableView: UITableView!
        
    // MARK: - Public properties

    var presenter: CreateTeamPresenterDelegate!
    var configurator: CreateTeamConfiguratorDelegate!
    
    // MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.config(viewController: self)
    }
    
}

extension CreateTeamViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRowsIn(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = self.presenter.cellId(forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        self.presenter.config(cell: cell, indexPath: indexPath)
        if let cellCreate = cell as? CreatePlayerTableViewCell {
            cellCreate.onCreateButtonTapped = { [weak self] in
                self?.presenter.createPlayer()
            }
            cellCreate.nameTextField.delegate = self
            cellCreate.surnameTextField.delegate = self
            cellCreate.numberTextField.delegate = self
            
            cellCreate.nameTextField.tag = 100
            cellCreate.surnameTextField.tag = 101
            cellCreate.numberTextField.tag = 102
            
            cellCreate.nameTextField.text = presenter.creatingPlayerName
            cellCreate.surnameTextField.text = presenter.creatingPlayerSurname
            cellCreate.numberTextField.text = presenter.creatingPlayerNumber
        }
//        if let cellInfo = cell as? InfoTableViewCell {
//            //
//        }
        cell.selectionStyle = .none
        return cell
    }
    
}

extension CreateTeamViewController: UITableViewDelegate {

}

// MARK: Self-delegate

extension CreateTeamViewController: CreateTeamViewDelegate {

    func showAlert(title: String, withText: String) {
        self.showAlert(title, withText)
    }
    
    func updateView() {
        self.createTableView.reloadData()
    }
    
    func clearEntryFields() {
        
    }
    
}

// MARK: - IBActions

private extension CreateTeamViewController {
    
    @IBAction func createTeamAction(_ sender: Any) {
        self.presenter.createTeam()
    }
    
}
    
// MARK: - UITextFieldDelegate
    
extension CreateTeamViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField.tag {
        case 100:
            self.presenter.nameChanged(newString)
        case 101:
            self.presenter.surnameChanged(newString)
        case 102:
            self.presenter.numberChanged(newString)
        default:
            break
        }
        return true
    }
}
