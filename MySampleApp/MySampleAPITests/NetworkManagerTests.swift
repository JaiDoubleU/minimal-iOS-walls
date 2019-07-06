//
//  NetworkManagerTests.swift
//  MySampleAppTests
//
//  Created by Alex Núñez on 09/06/2019.
//  Copyright © 2019 All rights reserved.
//

import Foundation
import XCTest

@testable import MySampleAPI

class NetworkManagerTests: XCTestCase {
	
	var session: MockURLSession!
	var networkModel: NetworkModel!
	var networkManager: NetworkManager!
	
	override func setUp() {
		super.setUp()
		
		session = MockURLSession()
		networkModel = NetworkModel(base: PixabayNetworkServiceUrls.apiBase,
									path: PixabayNetworkServiceUrls.apiPath,
									method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)
	}
	
	override func tearDown() {
		super.tearDown()
		session = nil
		networkModel = nil
		networkManager = nil
	}
	
	func test_execute_withURL_shouldHaveSessionURL() {
		guard let url = URL(string: "https://pixabay.com/api/") else {
			fatalError("URL can't be empty")
		}
		
		networkManager.execute { (result) in
		}
		
		XCTAssert(session.lastURL == url)
	}
	
	func test_execute_withBadURL_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Get request")

		// specific network model with bad URL
		networkModel = NetworkModel(base: "((\\w)*|([0-9]",
									path: PixabayNetworkServiceUrls.apiPath,
									params: nil,
									headers: nil,
									method: .get)
		networkManager = NetworkManager(networkModel: networkModel, session: session)

		networkManager.execute { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "We shouldn't get an data")
			case .failure(let error):
				if error != NetworkError.badURL {
					XCTFail("The error is different from empty data")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_execute_withNoData_shouldReturnError() {
		let expectation = XCTestExpectation(description: "Should get bad url error")
		networkManager.execute { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data, "We shouldn't get an data")
			case .failure(let error):
				if error != NetworkError.emptyData {
					XCTFail("The error is different to bad URL")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_execute_shouldCallResume() {
		let dataTask = MockURLSessionDataTask()
		session.nextDataTask = dataTask
		
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		networkManager.execute { (result) in
		}
		
		XCTAssert(dataTask.resumeWasCalled)
	}
	
	func test_execute_withData_shouldReturnData() {
		let expectedData = "{}".data(using: .utf8)
		session.nextData = expectedData
		
		let expectation = XCTestExpectation(description: "Get request")
		
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		networkManager.execute { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data)
			case .failure( _):
				XCTFail("There is an error whilst downloading data")
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
	
	func test_execute_withServerError_shouldReturnError() {
		session.nextError = NetworkError.apiError(error: NetworkError.unknownError)
		
		let expectation = XCTestExpectation(description: "Get request")
		
		networkManager = NetworkManager(networkModel: networkModel, session: session)
		networkManager.execute { (result) in
			switch result {
			case .success(let data):
				XCTAssertNotNil(data)
			case .failure(let error ):
				if error != NetworkError.apiError(error: NetworkError.unknownError) {
					XCTFail("The error is different to API Error")
				}
			}
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 3.0)
	}
}


