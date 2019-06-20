//
//  MockPixabayNetworkService.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 20/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
@testable import MySampleApp

class MockPixabayNetworkService: PixabayNetworkServiceProtocol {
	let session:  MockURLSession
	let networkModel: NetworkModel
	var networkManager: NetworkManagerProtocol
	
	private let pixaBayNetworkService: PixabayNetworkService
	
	init() {
		// Session
		session = MockURLSession()
		networkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
									path: PixabayNetworkServiceUrls.apiPath,
									params: nil,
									headers: nil,
									method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		
		// Services
		pixaBayNetworkService = PixabayNetworkService(networkManager: networkManager)
	}
	
	func getHits(_ completionHandler: @escaping ((Result<[Hit], NetworkError>) -> Void)) {
		pixaBayNetworkService.getHits(completionHandler)
	}
	
	func decode(data: Data, completionHandler: ((Result<[Hit], NetworkError>) -> Void)) {
		pixaBayNetworkService.decode(data: data, completionHandler: completionHandler)
	}
}
