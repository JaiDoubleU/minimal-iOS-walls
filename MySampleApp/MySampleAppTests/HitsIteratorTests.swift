//
//  HitsIteratorTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 14/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleApp

class HitsIteratorTests: XCTestCase {
	
	var mockPixaBayNetworkService: MockPixabayNetworkService!
	var hitsIterator: HitsInteractor!
	var mockJson: Data?
	
	override func setUp() {
		super.setUp()
		
		// Services
		mockPixaBayNetworkService = MockPixabayNetworkService()
		hitsIterator = HitsInteractor(mockPixaBayNetworkService)
		
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
		mockPixaBayNetworkService = nil
		hitsIterator = nil
		mockJson = nil
	}
	
	func test_fetchHits_withData_shouldNotBeEmpty() {
		let expectation = XCTestExpectation(description: "Shouldn't be empty")
		
		mockPixaBayNetworkService.session.nextData = mockJson
		
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
		
		mockPixaBayNetworkService.session.nextData = mockJson
		
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
