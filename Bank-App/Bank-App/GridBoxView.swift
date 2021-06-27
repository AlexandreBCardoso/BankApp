//
//  GridBoxView.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import UIKit

class GridBoxView: UIView {
	
	lazy var imageView: UIImageView = {
		let view = UIImageView(frame: .zero)
		view.backgroundColor = .green
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


// MARK: - Extension CodeView
extension GridBoxView: CodeView {
	
	func buildViewHierarchy() {
		addSubview(imageView)
	}
	
	func setupConstraints() {
		imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
	}
	
	func setupAdditionalConfiguration() {
	}
	
}
