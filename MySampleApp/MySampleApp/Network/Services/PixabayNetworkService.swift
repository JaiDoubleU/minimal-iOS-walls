//
//  PixabayNetworkService.swift
//  MySampleApp
//
//  Created by Alex Núñez on 08/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

struct PixabayNetworkService {
	
	let networkManager: NetworkManager
	
	init() {
		let defaultParams = [URLQueryItem(name: "key", value: PixabayNetworkServiceApi.apiKey)]
		
		let networkModel = NetworkModel(base: PixabayNetworkServiceUrl.apiBase,
									path: PixabayNetworkServiceUrl.apiPath,
									params: defaultParams,
									headers: nil,
									method: .get)
		
		let urlSession = URLSession(configuration: URLSessionConfiguration.default)
		networkManager = NetworkManager(networkModel: networkModel, session: urlSession)
	}
	
	func getHits(_ completionHandler: @escaping ((Result<[Hit], Error>) -> Void)) { 
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
	
	private func decode(data: Data, completionHandler: ((Result<[Hit], Error>) -> Void)) {
		data.decode(to: PixabayHitsResponseModel.self, completionHandler: { (result) in
			switch result {
			case .success(let model):
				completionHandler(.success(model.hits))
			case .failure(let error):
				print(error.localizedDescription)
				completionHandler(.failure(error))
			}
		})
	}
}
