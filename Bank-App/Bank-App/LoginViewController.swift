//
//  LoginViewController.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import UIKit

class LoginViewController: UIViewController {
	
	let screen = LoginView()
	
	override func loadView() {
		self.view = screen
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}
