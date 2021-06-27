//
//  LoginView.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import UIKit

final class LoginView: UIView {
	
	lazy var button: UIButton = {
		let button = UIButton(frame: .zero)
		button.backgroundColor = UIColor(named: "mainColor")
		button.setTitle("Login", for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	lazy var imageView: UIImageView = {
		let view = UIImageView(frame: .zero)
		view.backgroundColor = .green
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let grigBox = GridBoxView()
	
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


// MARK: - Extension CodeView
extension LoginView: CodeView {
	
	func buildViewHierarchy() {
		addSubview(button)
		addSubview(imageView)
	}
	
	func setupConstraints() {
		button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
		button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
		
		imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
//		imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
		imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true

	}
	
	func setupAdditionalConfiguration() {
		button.layer.cornerRadius = 10
		backgroundColor = .darkGray
	}
	
}
