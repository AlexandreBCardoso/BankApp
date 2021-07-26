//
//  LoginView.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
	func actionLoginButton(user: String, password: String)
}

final class LoginView: UIView {
	
	weak var delegate: LoginViewDelegate?
	
	// MARK: - Elements UI
	lazy var button: UIButton = {
		let button = UIButton(frame: .zero)
		button.backgroundColor = UIColor(named: "mainColor")
		button.setTitle("Login", for: .normal)
		button.layer.cornerRadius = 10
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var imageView: UIImageView = {
		let view = UIImageView(frame: .zero)
		view.image = UIImage(named: "Logo")
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var userTextField: UITextField = {
		let textField = UITextField(frame: .zero)
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.layer.borderWidth = 0.8
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.layer.cornerRadius = 5
		textField.placeholder = "User"
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.text = "test_user"
		return textField
	}()
	
	lazy var passwordTextField: UITextField = {
		let textField = UITextField(frame: .zero)
		textField.placeholder = "Password"
		textField.layer.borderWidth = 0.8
		textField.layer.borderColor = UIColor.lightGray.cgColor
		textField.layer.cornerRadius = 5
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		textField.leftViewMode = .always
		textField.text = "Test@1"
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()
	
	
	// MARK: - Initialize
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: - Function
	func setupTextFieldDelegate(delegate: UITextFieldDelegate) {
		userTextField.delegate = delegate
		passwordTextField.delegate = delegate
	}
	
	@objc
	func actionButton(_ sender: UIButton) {
		let user = userTextField.text ?? ""
		let password = passwordTextField.text ?? ""
		delegate?.actionLoginButton(user: user, password: password)
	}
	
	fileprivate func animateView(_ viewToAnimate: UIView) {
		UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
			viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
			
		} completion: { _ in
			UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseIn, animations: {
				viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
				
			}, completion: nil)
		}

	}
	
}


// MARK: - Extension CodeView
extension LoginView: CodeView {
	
	func buildViewHierarchy() {
		addSubview(imageView)
		addSubview(userTextField)
		addSubview(passwordTextField)
		addSubview(button)
	}
	
	func setupConstraints() {
		imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
		imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 125).isActive = true
		
		userTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 105).isActive = true
		userTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
		userTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
		userTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20).isActive = true
		passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
		passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
		passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 86).isActive = true
		button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -86).isActive = true
		button.heightAnchor.constraint(equalToConstant: 60).isActive = true
		button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true

	}
	
	func setupAdditionalConfiguration() {
		backgroundColor = .white
		
		button.addTarget(self, action: #selector(self.actionButton(_:)), for: .touchUpInside)
	}
	
}
