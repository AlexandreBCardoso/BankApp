//
//  LoginViewController.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	let screen = LoginView()
	
	let viewModel = LoginViewModel()
	
	
	// MARK: - Initialize
	override func loadView() {
		screen.delegate = self
		screen.setupTextFieldDelegate(delegate: self)
		self.view = screen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.delegate = self
	}
	
	
	// MARK: - Function
	private func setupTextField() {
		screen.userTextField.delegate = self
		screen.passwordTextField.delegate = self
	}
	
}


// MARK: - Extension UITextField
extension LoginViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
	
}


// MARK: - Extension LoginView
extension LoginViewController: LoginViewDelegate {
	
	func actionLoginButton(user: String, password: String) {
		viewModel.login(user: user, password: password)
	}
	
}


// MARK: - Extension ViewModel
extension LoginViewController: LoginViewModelProtocol {
	
	func loginError() {
		print(#function)
	}
	
	func loginSuccess() {
		print(#function)
	}
	
	func errorValidate() {
		let alertController = UIAlertController(title: "Dados inválidos",
															 message: "Preencha corretamento os dados User e Password",
															 preferredStyle: .alert)
		let actionOk = UIAlertAction(title: "OK", style: .default) { _ in
			self.screen.userTextField.text = nil
			self.screen.passwordTextField.text = nil
		}
		alertController.addAction(actionOk)
		
		present(alertController, animated: true, completion: nil)
	}
	
}
