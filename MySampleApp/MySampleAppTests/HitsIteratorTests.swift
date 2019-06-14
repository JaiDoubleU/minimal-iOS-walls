//
//  HitsIteratorTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleApp

class HitsIteratorTests: XCTestCase {
	
	var session: MockURLSession!
	var networkModel: MockNetworkModel!
	var networkManager: NetworkManager!
	var pixaBayNetworkService: PixabayNetworkService!
	var hitsIterator: HitsInteractor!
	
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
		
		// TODO create mock json
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		networkModel = nil
		networkManager = nil
		
		pixaBayNetworkService = nil
		hitsIterator = nil
	}
	
	func test_fetchHits_withData() {
		let expectation = XCTestExpectation(description: "Should return 3 items")
		
		hitsIterator.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertEqual(data.count, 3, "The return item is diferent than 3")
				expectation.fulfill()
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}
