//
//  NetworkManager.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

class NetworkManager {

	typealias NetworkManagerCompleteHandler = ( Result<Data, NetworkError> ) -> Void

	private var networkModel: NetworkModel
	private let session: URLSessionProtocol

	required public init(networkModel: NetworkModel,
						 session: URLSessionProtocol) {
		self.networkModel = networkModel
		self.session = session
	}

	func execute(completionHandler: @escaping NetworkManagerCompleteHandler) {
		
		// creating the url components
		var urlComponnents = URLComponents(string: networkModel.base)
		
		if let path = networkModel.path {
			urlComponnents?.path = path
		}
		
		if let params = networkModel.params {
			urlComponnents?.queryItems = params
		}
		
		guard let url = urlComponnents?.url else {
			completionHandler(.failure(.badURL))
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = networkModel.method.rawValue
		
		let task = session.dataTask(with: request) { [weak self] (data, response, error) in
			self?.handleServerResponse(data: data, response: response, error: error, completionHandler: completionHandler)
		}
		
		task.resume()
	}

	private func handleServerResponse(data: Data?, response: URLResponse?, error: Error?, completionHandler: NetworkManagerCompleteHandler) {
		// Response
		if let response = response {
			print(response) // for debugging proposes
		}

		// Error
		if let error = error {
			print(error)    // for debugging proposes
			completionHandler(.failure(.apiError(error: error)))
			return
		}

		// Data
		guard let data = data else {
			completionHandler(.failure(.emptyData))
			return
		}

		completionHandler(.success(data))
	}
}
