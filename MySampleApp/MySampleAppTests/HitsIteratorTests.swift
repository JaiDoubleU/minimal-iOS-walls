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
	var networkModel: NetworkModel!
	var networkManager: NetworkManager!
	var pixaBayNetworkService: PixabayNetworkService!
	var hitsIterator: HitsInteractor!
	var mockJson: Data?
	
	override func setUp() {
		super.setUp()
	
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
		hitsIterator = HitsInteractor(pixaBayNetworkService)
		
		generateMockResponseModel()
	}
	
	private func generateMockResponseModel() {
		guard let ressourceURL = Bundle(for: type(of: self)).url(forResource: "PixabayHitsResponseModel", withExtension: "json"),
			let resourceData = try? Data(contentsOf: ressourceURL) else {
				XCTFail("PixabayHitsResponseModel.json file doesn't exist or it's invalid")
				return
		}
		
		mockJson = resourceData
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		networkModel = nil
		networkManager = nil
		
		pixaBayNetworkService = nil
		hitsIterator = nil
		mockJson = nil
	}
	
	func test_fetchHits_withData_shouldNotBeEmpty() {
		let expectation = XCTestExpectation(description: "Shouldn't be empty")
		
		session.nextData = mockJson
		
		hitsIterator.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "The data is empty")
				expectation.fulfill()
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_fetchHits_withData_shouldHave3Items() {
		let expectation = XCTestExpectation(description: "Should return 3 items")
		
		session.nextData = mockJson
		
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
	
	func test_fetchHits_withNoata() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		hitsIterator.fetchHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error == NetworkError.emptyData {
					expectation.fulfill()
				} else {
					XCTFail("fetchHits is returning a different error than empty data")
				}
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}
