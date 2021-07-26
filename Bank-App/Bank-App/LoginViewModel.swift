//
//  LoginViewModel.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
	func loginError()
	func loginSuccess()
	func errorValidate()
}

class LoginViewModel {
	
	weak var delegate: LoginViewModelProtocol?
	let service: ServiceRepository
	
	init(service: ServiceRepository = ServieBank()) {
		self.service = service
	}
	
	func login(user: String, password: String) {
		
		if validateUser(user: user) && validatePassword(password: password) {
			print("validado dados")
			let user = User(user: user, password: password)
			
			service.post(user: user) { (user, error) in
				print("")
			}
			

		} else {
			delegate?.errorValidate()
		}
		
	}
	
	func validateUser(user: String) -> Bool {
		if user == "" {
			return false
		} else {
			return true
		}
	}
	
	func validatePassword(password: String) -> Bool {
		if password == "" {
			return false
		} else {
			return true
		}

	}
	
}
