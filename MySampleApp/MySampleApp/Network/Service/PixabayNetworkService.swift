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
	let networkModel: NetworkModel
	let urlSession: URLSession
	
	init() {
		let defaultParams = [URLQueryItem(name: "key", value: PixabayNetworkServiceApi.apiKey)]
		
		networkModel = NetworkModel(base: PixabayNetworkServiceUrl.apiBase,
									path: PixabayNetworkServiceUrl.apiPath,
									params: defaultParams,
									headers: nil,
									method: .get)
		
		urlSession = URLSession(configuration: URLSessionConfiguration.default)
		networkManager = NetworkManager(networkModel: networkModel, session: urlSession)
	}
	
	func fetchData() {
		networkManager.execute { (result) in
			switch result {
			case .success(let data):
				print("\(data).")
			case .failure(let error):
				print(error.localizedDescription)
			}
		}
	}
}

