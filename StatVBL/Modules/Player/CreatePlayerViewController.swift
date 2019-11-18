//
//  CreatePlayerViewController.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 27.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

protocol CreatePlayerViewDelegate: class {
    func showAlert(title: String, withText: String)
    func updateView()
    func clearEntryFields()
    func hideScreen()
}

protocol CreatePlayerDelegate: class {
    func updateViewForNewPlayer()
}

final class CreatePlayerViewController: UIViewController {
   
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    // MARK: - Public properties
    
    var presenter: CreatePlayerPresenterDelegate!
    var configurator: CreatePlayerConfiguratorDelegate!
    weak var delegate: CreatePlayerDelegate?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurator.config(viewController: self)
        setupTextFields()
    }
    
}

// MARK: - Actions

extension CreatePlayerViewController {
    
    @IBAction func createPlayerButtonTapped(_ sender: Any) {
        presenter.createPlayer()
    }
    
}

// MARK: - CreatePlayerViewDelegate

extension CreatePlayerViewController: CreatePlayerViewDelegate {
    
    func showAlert(title: String, withText: String) {
        showAlert(title, withText)
    }
    
    func updateView() {
        
    }
    
    func clearEntryFields() {
        
    }
    
    func hideScreen() {
        delegate?.updateViewForNewPlayer()
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - UITextFieldDelegate

extension CreatePlayerViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case nameTextField:
            self.presenter.nameChanged(newString)
        case surnameTextField:
            self.presenter.surnameChanged(newString)
        case numberTextField:
            self.presenter.numberChanged(newString)
        default:
            break
        }
        return true
    }
    
}

// MARK: - Setup

private extension CreatePlayerViewController {
    
    func setupTextFields() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        numberTextField.delegate = self
        
        nameTextField.autocapitalizationType = .sentences
        surnameTextField.autocapitalizationType = .sentences
        numberTextField.autocapitalizationType = .sentences
        
        nameTextField.placeholder = "Имя"
        surnameTextField.placeholder = "Фамилия"
        numberTextField.placeholder = "Номер"
        
        numberTextField.keyboardType = .numberPad
    }
    
}
