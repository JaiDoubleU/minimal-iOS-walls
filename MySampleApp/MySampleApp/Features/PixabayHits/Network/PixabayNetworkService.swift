//
//  PixabayNetworkService.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// Allows to get hit models from the internet
struct PixabayNetworkService: PixabayNetworkServiceProtocol {
	
	private (set) var networkManager: NetworkManagerProtocol
	
	init() {
		/// Pixabay needs the api key as a get param
		let defaultParams = [URLQueryItem(name: "key", value: PixabayNetworkServiceKeys.apiKey)]
		
		let networkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
										path: PixabayNetworkServiceUrls.apiPath,
										params: defaultParams,
										headers: nil,
										method: .get)
		
		let urlSession = URLSession(configuration: URLSessionConfiguration.default)
		networkManager = NetworkManager(networkModel: networkModel, session: urlSession)
	}
	
	init(networkManager: NetworkManagerProtocol) {
		self.networkManager = networkManager
	}
	
	
	/// download hits
	///
	/// - Parameter completionHandler: Result<[Hit], NetworkError>
	func getHits(_ completionHandler: @escaping ((Result<[Hit], NetworkError>) -> Void)) {
		networkManager.execute { (result) in 
			switch result {
			case .success(let data):
				self.decode(data: data, completionHandler: completionHandler)
			case .failure(let error):
				print(error.localizedDescription)
				completionHandler(.failure(error))
			}
		}
	}
	
	/// decode the return data to a hit array
	///
	/// - Parameters:
	///   - data: json object
	///   - completionHandler: Result<[Hit], NetworkError>
	internal func decode(data: Data, completionHandler: ((Result<[Hit], NetworkError>) -> Void)) {
		data.decodeJSON(to: PixabayHitsResponseModel.self, completionHandler: { (result) in
			switch result {
			case .success(let model):
				completionHandler(.success(model.hits))
			case .failure(let error):
				print(error.localizedDescription)
				completionHandler(.failure(.apiError(error: error)))
			}
		})
	}
}

