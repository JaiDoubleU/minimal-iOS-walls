//
//  HitsIterators.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// handles the connection between the network service and viewmodel. it allows us to fetch hits, in the future we can save hits in the DB that why we separate this from the network service class
public struct HitsInteractor: HitsInteractorProtocol {
	
	private (set) var dataService: PixabayNetworkServiceProtocol
	
	/// Initializer
	///
	/// - Parameter dataService: PixabayNetworkServiceProtocol
	public init(_ dataService: PixabayNetworkServiceProtocol = PixabayNetworkService()) {
		self.dataService = dataService
	}
	
	
	/// Convenience Initializer
	/// it creates a default PixabayNetworkService from a custom url
	/// - Parameter url: getFromUrl
	public init(getFromUrl url: String) {
		let networkModel = NetworkModel(base: url, method: .get)
		let urlSession = URLSession(configuration: URLSessionConfiguration.default)
		let networkManager = NetworkManager(networkModel: networkModel, session: urlSession)
		self.dataService = PixabayNetworkService(networkManager: networkManager)
	}
	
	/// fetchHits
	///
	/// - Parameter completionHandler: returns hit models
	public func fetchHits(_ completionHandler: @escaping (Result<[Hit], NetworkError>) -> Void) {
		dataService.getHits(completionHandler)
	}
		
	/// downloadImage
	///
	/// - Parameter completionHandler: returns the downloaded image as Data
	public func downloadImage(_ completionHandler: @escaping ((Result<Data, NetworkError>) -> Void)) {
		dataService.downloadImage(completionHandler)
	}
}
