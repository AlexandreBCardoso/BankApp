//
//  CodeView.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import Foundation

protocol CodeView {
	func buildViewHierarchy()
	func setupConstraints()
	func setupAdditionalConfiguration()
	func setupView()
}

extension CodeView {
	func setupView() {
		buildViewHierarchy()
		setupConstraints()
		setupAdditionalConfiguration()
	}
}
