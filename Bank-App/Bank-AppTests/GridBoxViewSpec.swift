//
//  GridBoxViewSpec.swift
//  Bank-AppTests
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import Bank_App

class GridBoxViewSpec: QuickSpec {
	
	override func spec() {
		describe("The UI") {
			it("Should have the expected look and fell") {
				let frame = CGRect(x: 0, y: 0, width: 250, height: 300)
				let view = GridBoxView(frame: frame)

				expect(view) == snapshot("GridBoxView")
			}
		}
	}
	
}
