//
//  HitsIterators.swift
//  MySampleApp
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation

struct HitsInteractor: HitsInteractorProtocol {
	
	var dataService: PixabayNetworkService
	
	init (_ dataService: PixabayNetworkService = PixabayNetworkService()) {
		self.dataService = dataService
	}
	
	func fetchHits(_ completionBlock: @escaping (Result<[Hit], NetworkError>) -> Void) {
		dataService.getHits(completionBlock)
	}
}
