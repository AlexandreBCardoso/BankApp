//
//  ServiceRepository.swift
//  Bank-App
//
//  Created by Alexandre Cardoso on 27/06/21.
//

import Foundation

protocol ServiceRepository {
	func post(user: User, completion: @escaping(_ user: User?, _ error: Error?) -> Void)
	func get()
}

class ServieBank: ServiceRepository {
	
	func post(user: User, completion: @escaping (User?, Error?) -> Void) {
		
		let param = NSMutableDictionary()
		param.setValue(user.user, forKey: "user")
		param.setValue(user.password, forKey: "password")
		
//		let url = URL(string: "https://6092aef785ff5100172136c2.mockapi.io/api/login")!
		let url = URL(string: "https://bank-app-test.herokuapp.com/api/login")!
		
		var request = URLRequest(url: url)
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		
		let data = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
		request.httpBody = data
		
		let urlSession = URLSession.shared
		let requestData = urlSession.dataTask(with: request) { (data, response, error) in
			
			guard let jsonData = data else { return completion(nil, nil) }
			
			do {
				
//				let jsonObject = try JSONSerialization.data(withJSONObject: jsonData, options: [])
				let json = try JSONSerialization.jsonObject(with: jsonData) as! [[[String: Any]]]
				
//				if let json = jsonObject as? Data {
					print(json)
//				}
				
			} catch (let erro) {
				print("Error: \(erro.localizedDescription)")
			}
			

			
		}
		
		requestData.resume()
		
	}
	
	func get() {
	}
	
}
