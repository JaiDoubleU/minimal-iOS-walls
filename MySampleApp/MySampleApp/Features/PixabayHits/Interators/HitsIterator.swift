//
//  HitsIterators.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation

/// handles the connection between the network service and viewmodel. it allows us to fetch hits, in the future we can save hits in the DB
struct HitsInteractor: HitsInteractorProtocol {
	
	private (set) var dataService: PixabayNetworkServiceProtocol
	
	/// Initializer
	///
	/// - Parameter dataService: PixabayNetworkServiceProtocol
	init (_ dataService: PixabayNetworkServiceProtocol = PixabayNetworkService()) {
		self.dataService = dataService
	}
	
	/// fetchHits
	///
	/// - Parameter completionBlock: retruns hit models
	func fetchHits(_ completionBlock: @escaping (Result<[Hit], NetworkError>) -> Void) {
		dataService.getHits(completionBlock)
	}
}
