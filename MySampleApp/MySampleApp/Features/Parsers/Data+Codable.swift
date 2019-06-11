//
//  NetworkParserService.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

extension Data {
	
	// This method allows us to decode any object that conforms to Decodable
	func decodeJSON<T: Decodable>(to: T.Type, completionHandler: ((Result<T, Error>) -> Void)) {
		do {
			let item = try JSONDecoder().decode(T.self, from: self)
			completionHandler(.success(item))
		} catch {
			completionHandler(.failure(error))
		}
	}
}
