//
//  LoginViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 08/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonLogin.isEnabled = false
        self.buttonLogin.backgroundColor = UIColor.gray
        [loginTextField, passwordTextField].forEach({ $0?.addTarget(self, action: #selector(verifyFields), for: .editingChanged)})
        
    }
    
    @objc func verifyFields(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        guard
            let login = loginTextField.text, !login.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else {
            self.buttonLogin.isEnabled = false
            self.buttonLogin.backgroundColor = UIColor.gray
            return
        }
        
        self.buttonLogin.isEnabled = true
        self.buttonLogin.backgroundColor = UIColor.orange
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        self.showLoader()
        if let user = self.loginTextField.text, let password = self.passwordTextField.text {
            self.viewModel.doLogin(user: user, password: password,
                success: { [weak self] extract in
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    if let viewController = storyBoard.instantiateViewController(withIdentifier: "ExtractListViewController") as? ExtractListViewController {
                        viewController.viewModel = ExtractListViewModel(extract)
                        self?.navigationController?.pushViewController(viewController, animated: true)
                    }
                    
            }, failure: { [weak self] message in
                    self?.hideLoader()
                    self?.showAlertError(message: message ?? "Erro desconhecido")
                }
            )
        }
    }
}
