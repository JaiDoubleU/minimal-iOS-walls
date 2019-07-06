//
//  NetworkManager.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// NetworkManager handles all the complexities of
public class NetworkManager: NetworkManagerProtocol {
	public typealias NetworkManagerCompleteHandler = ( Result<Data, NetworkError> ) -> Void

	private (set) var networkModel: NetworkModelProtocol
	private (set) var session: URLSessionProtocol

	/// Initializes the NetworkManager with a NetworkModelProtocol (base, path, headers etc)
	///
	/// - Parameters:
	///   - networkModel: NetworkModelProtocol object. this object containsproperties such as  (base, path, headers, http method etc)
	///   - session: URLSessionProtocol object you can pass your MockURLSession as well
	required public init(networkModel: NetworkModelProtocol,
						 session: URLSessionProtocol) {
		self.networkModel = networkModel
		self.session = session
	}
	
	/// starts session task
	///
	/// - Parameter completionHandler:  Result<Data, NetworkError>
	public func execute(completionHandler: @escaping NetworkManagerCompleteHandler) {
		// creating the url components
		var urlComponnents = URLComponents(string: networkModel.base)
		
		// path
		if let path = networkModel.path {
			urlComponnents?.path = path
		}
		
		// params
		if let params = networkModel.params {
			urlComponnents?.queryItems = params
		}
		
		guard let url = urlComponnents?.url, !url.absoluteString.isEmpty else {
			completionHandler(.failure(.badURL))
			return
		}
		
		// URLRequest
		var request = URLRequest(url: url)
		request.httpMethod = networkModel.method.rawValue // http method (.post, .get, .put ...)
		
		// headers
		if let headers = networkModel.headers {
			request.allHTTPHeaderFields = headers.headers
		}
		
		let task = session.dataTask(with: request) { [weak self] (data, response, error) in
			self?.handleServerResponse(data: data, response: response, error: error, completionHandler: completionHandler)
		}
		
		task.resume()
	}

	/// verifies that the data provided by the server is correct and it will generate meaninful errors in case that's not the case
	///
	/// - Parameters:
	///   - data: data object
	///   - response: The metadata associated with the response to a URL load request, independent of protocol and URL scheme.
	///   - error: returned error from the server
	///   - completionHandler: Result<Data, NetworkError>
	public func handleServerResponse(data: Data?, response: URLResponse?, error: Error?, completionHandler: NetworkManagerCompleteHandler) {
		// Response
		if let response = response {
			print(response) // for debugging proposes
		}

		// Error
		if let error = error {
			print(error)    // for debugging proposes
			
			// in the future we can check the status codes and create more errors ,404, 403 errors for example
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
