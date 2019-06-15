//
//  PixabayNetworkServiceTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 15/06/2019.
//  Copyright © 2019 Touchsoft. All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleApp

class PixabayNetworkServiceTests: XCTestCase {
	
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
		networkModel = NetworkModel(base: PixabayNetworkServiceUrl.apiBase,
									path: PixabayNetworkServiceUrl.apiPath,
									params: nil,
									headers: nil,
									method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		
		// Services
		pixaBayNetworkService = PixabayNetworkService(networkManager: networkManager)
		
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
	
	func test_getHits_withData_shouldNotBeEmpty() {
		let expectation = XCTestExpectation(description: "Shouldn't be empty")
		
		session.nextData = mockJson
		pixaBayNetworkService.getHits { (result) in
			switch result {
			case .success(let hits):
				XCTAssertNotNil(hits, "The data is empty")
				expectation.fulfill()
			case .failure(_):
				XCTFail("It shouldn't return an error")
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_getHits_withData_shouldHave3Items() {
		let expectation = XCTestExpectation(description: "Should return 3 items")
		
		session.nextData = mockJson
		
		pixaBayNetworkService.getHits { (result) in
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
		
		pixaBayNetworkService.getHits { (result) in
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
	
	func test_fetchHits_withError() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		session.nextError = NetworkError.apiError(error: NetworkError.unknownError)
		
		pixaBayNetworkService.getHits { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error == NetworkError.apiError(error: NetworkError.unknownError) {
					expectation.fulfill()
				} else {
					XCTFail("fetchHits is returning a different error than apiError")
				}
			}
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_decode_withBadData_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Shouldn't return data")
		
		pixaBayNetworkService.decode(data: Data(), completionHandler: { (result) in
			switch result {
			case .success(let data):
				XCTAssertNil(data, "Data should be nil")
			case .failure(let error):
				if error == NetworkError.apiError(error: NetworkError.unknownError) {
					expectation.fulfill()
				} else {
					XCTFail("fetchHits is returning a different error than apiError")
				}
			}
		})
		
		wait(for: [expectation], timeout: 3.0)
	}
	
}

