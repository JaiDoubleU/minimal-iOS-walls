//
//  HitsViewModelTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleApp

class HitsViewModelTests: XCTestCase {
	
	var session: MockURLSession!
	var networkModel: MockNetworkModel!
	var networkManager: NetworkManager!
	var pixaBayNetworkService: PixabayNetworkService!
	var hitsIterator: HitsInteractor!
	var coordinator: MockCoordinator!
	var hitsViewModel: HitsViewModel!
	
	override func setUp() {
		super.setUp()
		
		session = MockURLSession()
		networkModel = MockNetworkModel(base: PixabayNetworkServiceUrl.apiBase,
										path: PixabayNetworkServiceUrl.apiPath,
										params: nil,
										headers: nil,
										method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		
		
		pixaBayNetworkService = PixabayNetworkService(networkManager: networkManager)
		
		hitsIterator = HitsInteractor(pixaBayNetworkService)
		coordinator = MockCoordinator()
		
		hitsViewModel = HitsViewModel(interactor: hitsIterator, coordinator: coordinator)
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		networkModel = nil
		networkManager = nil
		
		pixaBayNetworkService = nil
		hitsIterator = nil
		coordinator = nil
		hitsViewModel = nil
	}
	
	func test_fetchHits_withData() {
		
	}
}

