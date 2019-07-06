//
//  PixabayNetworkServiceTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 15/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleAPI

class PixabayNetworkServiceTests: XCTestCase {
	
	var defaultService: MockPixabayNetworkService!
	var hitsIterator: HitsInteractor!
	var mockJson: Data?
	var defaultNetworkModel: NetworkModel!
	
	override func setUp() {
		super.setUp()
		
		defaultService = MockPixabayNetworkService()
		
		// model
		defaultNetworkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
										   path: PixabayNetworkServiceUrls.apiPath,
										   method: .get)
		
		// Mock JSON file
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
		defaultService = nil
		hitsIterator = nil
		mockJson = nil
		defaultNetworkModel = nil
	}
	
	func test_getHits_withData_shouldNotBeEmpty() {
		let expectation = XCTestExpectation(description: "Shouldn't be empty")
		
		let session = MockURLSession()
		session.nextData = mockJson
		let service = MockPixabayNetworkService(session: session, networkModel: defaultNetworkModel)
		
		service.getHits { (result) in
			switch result {
			case .success(let hits):
				XCTAssertNotNil(hits, "The data is empty")
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_getHits_withData_shouldHave3Items() {
		let expectation = XCTestExpectation(description: "Should return 3 items")
		
		let session = MockURLSession()
		session.nextData = mockJson
		let service = MockPixabayNetworkService(session: session, networkModel: defaultNetworkModel)
		service.getHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertEqual(data.count, 3, "The return item is diferent than 3")
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_fetchHits_withNoata() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		defaultService.getHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error != NetworkError.emptyData {
					XCTFail("fetchHits is returning a different error than empty data")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_fetchHits_withError() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		let session = MockURLSession()
		session.nextError = NetworkError.apiError(error: NetworkError.unknownError)
		let service = MockPixabayNetworkService(session: session, networkModel: defaultNetworkModel)
		
		service.getHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error != NetworkError.apiError(error: NetworkError.unknownError) {
					XCTFail("fetchHits is returning a different error than apiError")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	// TODO downlaod iamges
}

