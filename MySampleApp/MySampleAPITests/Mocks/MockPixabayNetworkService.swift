//
//  MockPixabayNetworkService.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 20/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
@testable import MySampleAPI

class MockPixabayNetworkService: PixabayNetworkServiceProtocol {
	
	let pixabayNetworkService: PixabayNetworkServiceProtocol
	
	init() {
		// Session
		let session = MockURLSession()
		let networkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
									path: PixabayNetworkServiceUrls.apiPath,
									method: .get)
		let networkManager = NetworkManager(networkModel: networkModel, session: session)
		
		// Services
		pixabayNetworkService = PixabayNetworkService(networkManager: networkManager)
	}
	
	init(session: URLSessionProtocol = MockURLSession(), networkModel: NetworkModel) {
		let networkManager = NetworkManager(networkModel: networkModel, session: session)
		pixabayNetworkService = PixabayNetworkService(networkManager: networkManager)
	}
	
	func getHits(_ completionHandler: @escaping ((Result<[Hit], NetworkError>) -> Void)) {
		pixabayNetworkService.getHits(completionHandler)
	}
	
	func decode(data: Data, completionHandler: ((Result<[Hit], NetworkError>) -> Void)) {
		pixabayNetworkService.decode(data: data, completionHandler: completionHandler)
	}
	
	func downloadImage(_ completionHandler: @escaping ((Result<UIImage, NetworkError>) -> Void)) {
		pixabayNetworkService.downloadImage(completionHandler)
	}

}
