//
//  LoginViewSpec.swift
//  Bank-AppTests
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import Bank_App

class LoginViewSpec: QuickSpec {
	
	override func spec() {
		describe("The UI") {
			it("UI Login") {
				let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
				let view = LoginView(frame: frame)
				
				expect(view) == snapshot("LoginView")
			}
		}
	}
	
}
